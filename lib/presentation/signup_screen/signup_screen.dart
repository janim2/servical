import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/widgets/toast.dart';

import '../../backend/auth/user/signup.dart';
import '../../widgets/button.dart';
import 'controller/signup_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController usernametextEdittingController =
      TextEditingController();
  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController phonetextEdittingController = TextEditingController();

  TextEditingController passwordTextEdittingController =
      TextEditingController();
  TextEditingController confirmPasswordtextEdittingController =
      TextEditingController();

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            // backgroundColor: ColorConstant.white,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // GetBuilder<SignUpScreenController>(
                        //   builder: (_) {
                        //     return ModalProgressHUD(
                        //         inAsyncCall: _.isloading, child: Text("Loading"));
                        //   },
                        // ),
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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: usernametextEdittingController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Username required';
                                      }
                                    },
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
                                  TextFormField(
                                    controller: emailtextEdittingController,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email required';
                                      } else if (!value.contains("@")) {
                                        return 'Enter valid email';
                                      }
                                    },
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
                                  TextFormField(
                                    controller: phonetextEdittingController,
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Phone required';
                                      }
                                    },
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
                                        hintText: "Phone Number:",
                                        hintStyle: TextStyle(
                                            fontFamily: "Sora",
                                            color: ColorConstant.primary)),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: passwordTextEdittingController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _isVisible ? false : true,
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
                                          color: ColorConstant.primary),
                                      suffixIcon: IconButton(
                                        onPressed: () => updateStatus(),
                                        icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: ColorConstant.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller:
                                        confirmPasswordtextEdittingController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _isVisible ? false : true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(r"\s\b|\b\s"))
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password required';
                                      } else if (value.length < 6) {
                                        return 'Password length must be greater than 6';
                                      } else if (value !=
                                          passwordTextEdittingController.text) {
                                        return 'Password mismatch';
                                      }
                                    },
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
                                          color: ColorConstant.primary),
                                      suffixIcon: IconButton(
                                        onPressed: () => updateStatus(),
                                        icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: ColorConstant.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DefaultButton(
                                    textonButton: "SignUp",
                                    ontap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        startSpinner();
                                        // Do your jobs with the validated form data.

                                        var reg = await SignUp(context,
                                            email: emailtextEdittingController
                                                .text,
                                            password:
                                                passwordTextEdittingController
                                                    .text,
                                            phone: phonetextEdittingController
                                                .text,
                                            username:
                                                usernametextEdittingController
                                                    .text);
                                        if (reg != null) {
                                          stopSpinner();
                                          showAlert(
                                              context, "error", reg.toString(),
                                              () {
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      }
                                    },
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
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
                                                      color: ColorConstant
                                                          .primary),
                                                ),
                                                TextSpan(
                                                  text: 'Sign Up ',
                                                  style: TextStyle(
                                                      fontFamily: "Sora",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorConstant
                                                          .primary),
                                                ),
                                                TextSpan(
                                                  text: 'here',
                                                  style: TextStyle(
                                                      fontFamily: "Sora",
                                                      fontSize: 15,
                                                      color: ColorConstant
                                                          .primary),
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
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.loginRoute);
                                          },
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Already have an account?',
                                                  style: TextStyle(
                                                      fontFamily: "Sora",
                                                      fontSize: 15,
                                                      color: ColorConstant
                                                          .primary),
                                                ),
                                                TextSpan(
                                                  text: 'Sign In',
                                                  style: TextStyle(
                                                      fontFamily: "Sora",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorConstant
                                                          .primary),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ))
                      ],
                    ),
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
