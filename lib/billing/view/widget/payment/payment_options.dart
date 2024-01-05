import 'package:delivery_app/billing/view/widget/payment/card_view.dart';
import 'package:delivery_app/billing/view/widget/payment/upi_id_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  RxString selectedRadioValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: [
            Container(
              height: selectedRadioValue.value == '' ? 200.0.h : 240.h,
              width: double.infinity,
              padding: EdgeInsets.all(20.0.dm),
              child: Obx(
                () {
                  return selectedRadioValue.value == ''
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select your payment Mode',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RadioListTile<String>(
                                    title: const Text(
                                      'UPI ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'upi_mode',
                                    groupValue: selectedRadioValue.value,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRadioValue.value = value!;
                                      });
                                      print(
                                          "The Curent Item selected $selectedRadioValue");
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: const Text(
                                      'CREDIT / DEBIT CARD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'card_mode',
                                    groupValue: selectedRadioValue.value,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRadioValue.value = value!;
                                      });
                                      print(
                                          "The Curent Item selected $selectedRadioValue");
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0.h),
                          ],
                        )
                      : selectedRadioValue.value == 'card_mode'
                          ? CardViewWidget()
                          : UpiViewWidget();
                },
              ),
            ),
            Positioned(
              bottom: 30.0.h,
              right: 20.0.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
