import '../../widgets/button.dart';
import 'controller/forgot_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordScreenController> {
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
                              "Forgot Password",
                              style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 20,
                                  color: ColorConstant.primary),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: size.height,
                          width: size.width,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              TextField(
                                // controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                style: TextStyle(
                                    color: ColorConstant.primary,
                                    fontFamily: "Sora",
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),

                                    // hintStyle: textfield_hint_style,
                                    hintText: "Phone number:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              DefaultButton(
                                textonButton: "Submit",
                                ontap: () {
                                  Get.toNamed(AppRoutes.otpScreenRoute);
                                },
                              ),
                            ],
                          ))
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
