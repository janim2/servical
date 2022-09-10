import '../../widgets/button.dart';
import 'controller/otp_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class OTPScreen extends GetWidget<OTPScreenController> {
  bool first = true;
  bool last = true;
  TextEditingController code_1Controller = TextEditingController();
  TextEditingController code_2Controller = TextEditingController();
  TextEditingController code_3Controller = TextEditingController();
  TextEditingController code_4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            // backgroundColor: ColorConstant.white,
            body: Container(
              width: size.width,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/curved_top.png",
                        // fit: BoxFit.contain,
                        width: size.width,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "OTP Verification",
                              style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 20,
                                  color: ColorConstant.primary),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // _customTextFieldOTP(first: true, last: false),
                            Container(
                              height: 70,
                              width: 70,
                              child: TextField(
                                controller: code_1Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  first = true;
                                  last = false;
                                  if (value.length == 1 && last == false) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty && first == false) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.0,
                                    letterSpacing: 0.4,
                                    fontFamily: "Sora"),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  filled: true,
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(width: 8.w,),
                            // _customTextFieldOTP(first: false, last: false),
                            Container(
                              height: 70,
                              width: 70,
                              child: TextField(
                                controller: code_2Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  first = false;
                                  last = false;
                                  if (value.length == 1 && last == false) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty && first == false) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.0,
                                    letterSpacing: 0.4,
                                    fontFamily: "Sora"),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  filled: true,
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(width: 8.w,),

                            // _customTextFieldOTP(first: false, last: false),
                            Container(
                              height: 70,
                              width: 70,
                              child: TextField(
                                controller: code_3Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  first = false;
                                  last = false;
                                  if (value.length == 1 && last == false) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty && first == false) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.0,
                                    letterSpacing: 0.4,
                                    fontFamily: "Sora"),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  filled: true,
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(width: 8.w,),

                            // _customTextFieldOTP(first: false, last: true),
                            Container(
                              height: 70,
                              width: 70,
                              child: TextField(
                                controller: code_4Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  first = false;
                                  last = true;
                                  if (value.length == 1 && last == false) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty && first == false) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.0,
                                    letterSpacing: 0.4,
                                    fontFamily: "Sora"),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  filled: true,
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: ColorConstant.primary),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: DefaultButton(
                          textonButton: "Verify",
                          ontap: () {
                            Get.toNamed(AppRoutes.resetPasswordRoute);
                          },
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPasswordRoute);
                              },
                              child: Text(
                                "Didn't recieve an OTP? Resend",
                                style: TextStyle(
                                    fontFamily: "Sora",
                                    fontSize: 15,
                                    color: ColorConstant.primary),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
