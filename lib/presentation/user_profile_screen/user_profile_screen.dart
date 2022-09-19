import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart';

import '../../backend/profile/updateUserProfile.dart';
import '../../widgets/button.dart';
import 'controller/user_profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  TextEditingController usernametextEdittingController =
      TextEditingController();
  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController phonetextEdittingController = TextEditingController();

  TextEditingController fullnameTextEdittingController =
      TextEditingController();

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
  void initState() {
    FetchFromSharedPreferences();
    super.initState();
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
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/curved_top.png",
                              // fit: BoxFit.contain,
                              width: size.width,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Icon(
                                  UniconsLine.arrow_circle_left,
                                  color: ColorConstant.white,
                                  size: 39,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, top: 110.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontFamily: "Sora",
                                        fontSize: 30,
                                        color: ColorConstant.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                    controller: fullnameTextEdittingController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Fullname required';
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
                                        hintText: "Fullname:",
                                        hintStyle: TextStyle(
                                            fontFamily: "Sora",
                                            color: ColorConstant.primary)),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
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
                                  DefaultButton(
                                    textonButton: "Update",
                                    ontap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        startSpinner();
                                        // Do your jobs with the validated form data.

                                        var reg = await UpdateUserProfile(
                                          context,
                                          fullname:
                                              fullnameTextEdittingController
                                                  .text,
                                          username:
                                              usernametextEdittingController
                                                  .text,
                                          email:
                                              emailtextEdittingController.text,
                                          phone:
                                              phonetextEdittingController.text,
                                        );
                                        if (reg != null) {
                                          stopSpinner();
                                          showAlert(
                                              context, "error", reg.toString(),
                                              () {
                                            Navigator.of(context).pop();
                                          });
                                        }
                                        // var reg = await SignUp(context,
                                        //     email: emailtextEdittingController
                                        //         .text,
                                        //     password:
                                        //         passwordTextEdittingController
                                        //             .text,
                                        //     phone: phonetextEdittingController
                                        //         .text,
                                        //     username:
                                        //         usernametextEdittingController
                                        //             .text);
                                        // if (reg != null) {
                                        //   stopSpinner();
                                        //   showAlert(
                                        //       context, "error", reg.toString(),
                                        //       () {
                                        //     Navigator.of(context).pop();
                                        //   });
                                        // }
                                      }
                                    },
                                  ),
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

  FetchFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullnameTextEdittingController.text =
        prefs.getString("fullname").toString() == "null"
            ? ""
            : prefs.getString("fullname").toString();
    usernametextEdittingController.text =
        prefs.getString("username").toString();
    emailtextEdittingController.text = prefs.getString("email").toString();
    phonetextEdittingController.text =
        prefs.getString("phonenumber").toString();
  }
}
