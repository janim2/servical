import '../../widgets/button.dart';
import 'controller/signup_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class SignUpScreen extends GetWidget<SignUpScreenController> {
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
                              "Sign up",
                              style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 25,
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
                                    hintText: "Username:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
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
                                    hintText: "Email:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                // controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                style: TextStyle(
                                    color: ColorConstant.primary,
                                    fontFamily: "Sora",
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                    filled: true,
                                    // hintStyle: textfield_hint_style,
                                    hintText: "Password:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                // controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                style: TextStyle(
                                    color: ColorConstant.primary,
                                    fontFamily: "Sora",
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                    filled: true,
                                    // hintStyle: textfield_hint_style,
                                    hintText: "Confirm Password:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultButton(textonButton: "SignUp"),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.doctorSignupRoute);
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'As a doctor,',
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 15,
                                                  color: ColorConstant.primary),
                                            ),
                                            TextSpan(
                                              text: 'Sign Up ',
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorConstant.primary),
                                            ),
                                            TextSpan(
                                              text: 'here',
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 15,
                                                  color: ColorConstant.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 65,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.loginRoute);
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Already have an account?',
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 15,
                                                  color: ColorConstant.primary),
                                            ),
                                            TextSpan(
                                              text: 'Sign In',
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorConstant.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
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
