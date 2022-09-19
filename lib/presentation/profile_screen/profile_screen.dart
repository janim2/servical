import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart';
import '../../backend/profile/updateProfile.dart';
import '../../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

import '../../widgets/toast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  TextEditingController fullnametextEdittingController =
      TextEditingController();
  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController phonetextEdittingController = TextEditingController();
  TextEditingController hospitaltextEdittingController =
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
                            Image.asset(
                              "assets/images/doc.png",
                              // fit: BoxFit.contain,
                              width: size.width,
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: 40),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Profile",
                                        style: TextStyle(
                                            fontFamily: "Sora",
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: ColorConstant.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Icon(
                                    UniconsLine.arrow_circle_left,
                                    color: ColorConstant.white,
                                    size: 39,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
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
                                    controller: fullnametextEdittingController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Full Name required';
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
                                      hintText: "Full name:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Sora",
                                          color: ColorConstant.primary),
                                    ),
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
                                    controller: hospitaltextEdittingController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Hospital Name required';
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
                                        hintText: "Hospital Name:",
                                        hintStyle: TextStyle(
                                            fontFamily: "Sora",
                                            color: ColorConstant.primary)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DefaultButton(
                                    textonButton: "Update",
                                    ontap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        startSpinner();
                                        //Do your jobs with the validated form data.

                                        var reg = await UpdateProfile(context,
                                            email: emailtextEdittingController
                                                .text,
                                            phone: phonetextEdittingController
                                                .text,
                                            name: fullnametextEdittingController
                                                .text,
                                            hospital_name:
                                                hospitaltextEdittingController
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
    fullnametextEdittingController.text = prefs.getString("name").toString();
    emailtextEdittingController.text = prefs.getString("email").toString();
    phonetextEdittingController.text =
        prefs.getString("phonenumber").toString();
    hospitaltextEdittingController.text =
        prefs.getString("hospital").toString();
  }
}
