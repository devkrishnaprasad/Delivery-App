import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _dateOfBirthController = TextEditingController();
  String? dropDownValue;
  //DOB and Genter

  List<String> cityList = ['Male', 'Female', 'Others'];
  RxBool isUpdates = false.obs;
  Map<TextEditingController, String> initialFieldValues = {};

  void initState() {
    super.initState();
    _nameController.text = 'Krishna prasad R';
    _emailController.text = 'krishna.official.r@gmail.com';
    _phoneNumberController.text = '9539873221';
    _dateOfBirthController.text = '16/09/1998';

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

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Krishna prasad R';
    _emailController.text = 'krishna.official.r@gmail.com';
    _phoneNumberController.text = '9539873221';
    _dateOfBirthController.text = '16/09/1998';

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
              ),
            ),
            const Text(
              'Your Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
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
                        child: Image.asset(
                          'assets/images/My_profile.jpeg',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          print("Edit button is pressed..");
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
                    value: 'Male',
                    items: cityList
                        .map((cityTitle) => DropdownMenuItem(
                            value: cityTitle, child: Text("$cityTitle")))
                        .toList(),
                    onChanged: (String? value) {
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
                child: ElevatedButton(
                  onPressed: isUpdates.value
                      ? () {
                          debugPrint('Update button pressed..');
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: isUpdates.value
                        ? MaterialStateProperty.all<Color>(Colors.green)
                        : MaterialStateProperty.all<Color>(Colors.grey),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                          horizontal: 140.0.w, vertical: 10.0.h),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
