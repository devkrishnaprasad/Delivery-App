import 'dart:io';
import 'dart:typed_data';
import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/user_profile/controller/api/user_api.dart';
import 'package:delivery_app/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final HomeController _homeController = Get.find();
  final UserApiService _userApiService = Get.put(UserApiService());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();
  String? dropDownValue;
  //DOB and Genter

  List<String> genderList = ['Male', 'Female', 'Others'];
  var gender;
  String? fileName;
  RxBool isUpdates = false.obs;
  RxBool isLoding = false.obs;
  Map<TextEditingController, String> initialFieldValues = {};

  void initState() {
    super.initState();
    _nameController.text = _homeController.usersDetails[0].fullName;
    _emailController.text = _homeController.usersDetails[0].email;
    _phoneNumberController.text = _homeController.usersDetails[0].phoneNumber;
    _dateOfBirthController.text = _homeController.usersDetails[0].dateOfBirth;
    gender = _homeController.usersDetails[0].gender;
    _nameController.addListener(onFieldChanged);
    _phoneNumberController.addListener(onFieldChanged);
    _emailController.addListener(onFieldChanged);
    _dateOfBirthController.addListener(onFieldChanged);

    initialFieldValues = {
      _nameController: _nameController.text,
      _phoneNumberController: _phoneNumberController.text,
      _emailController: _emailController.text,
      _dateOfBirthController: _dateOfBirthController.text,
    };
  }

  void onFieldChanged() {
    setState(() {
      isUpdates.value = true;
    });
  }

  Uint8List? _image;
  File? selectedIMage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
            ),
            const Text(
              'Your Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
        leadingWidth: 200.w,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15.w, 0, 0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircleAvatar(
                      radius: 60.w,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: _image != null
                            ? CircleAvatar(
                                radius: 100,
                                backgroundImage: MemoryImage(_image!))
                            : _homeController.usersDetails[0].imageUrl == null
                                ? const CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                                  )
                                : CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                        _homeController
                                            .usersDetails[0].imageUrl!),
                                  ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          isUpdates.value = true;
                          await _pickImageFromGallery();
                        },
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'assets/icons/edit.png',
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.h, 40.w, 10.h, 0.w),
                child: TextFormField(
                  controller: _nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.h, 12.h, 0.h, 15.h),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
            
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.h, 20.w, 10.h, 0.w),
                child: TextFormField(
                  controller: _phoneNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.h, 12.h, 0.h, 15.h),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.h, 20.w, 10.h, 0.w),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.h, 12.h, 0.h, 15.h),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.h, 20.w, 10.h, 0.w),
                child: TextFormField(
                  controller: _dateOfBirthController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.h, 12.h, 0.h, 15.h),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.h, 20.w, 10.h, 0.w),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                    ),
                    value: _homeController.usersDetails[0].gender,
                    items: genderList
                        .map((cityTitle) => DropdownMenuItem(
                            value: cityTitle, child: Text("$cityTitle")))
                        .toList(),
                    onChanged: (String? value) {
                      gender = value;
                      print(value);
                    },
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0.h, 40.w, 0.h, 40.w),
                  child: Obx(() {
                    return isLoding.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: isUpdates.value
                                ? () async {
                                    isLoding.value = true;
                                    await _userApiService.updateUserDetails(
                                        selectedIMage != null
                                            ? selectedIMage!.path
                                            : "default",
                                        fileName,
                                        _nameController.text,
                                        _emailController.text,
                                        _phoneNumberController.text,
                                        _dateOfBirthController.text,
                                        gender,
                                        _homeController
                                                .usersDetails[0].imageUrl ??
                                            "");
                                    LocalStorage _localStorage = LocalStorage();
                                    var userId =
                                        await _localStorage.read('user_id');
                                    await _homeController
                                        .getUserDetails(userId);
                                    isLoding.value = false;
                                    isUpdates.value = false;
                                    debugPrint('Update button pressed..');
                                  }
                                : null,
                            style: ButtonStyle(
                              backgroundColor: isUpdates.value
                                  ? MaterialStateProperty.all<Color>(
                                      Colors.green)
                                  : MaterialStateProperty.all<Color>(
                                      Colors.grey),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    horizontal: 140.0.w, vertical: 10.0.h),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          );
                  }))
            ],
          )
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();

      fileName = returnImage.path.split('/').last;
    });
  }
}
