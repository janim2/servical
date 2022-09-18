import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../backend/auth/doc/signup.dart';
import '../../widgets/button.dart';
import '../../widgets/toast.dart';
import 'controller/doctor_verification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class DoctorVerificationScreen extends StatefulWidget {
  const DoctorVerificationScreen({Key? key}) : super(key: key);

  @override
  _DoctorVerificationScreenState createState() =>
      _DoctorVerificationScreenState();
}

class _DoctorVerificationScreenState extends State<DoctorVerificationScreen> {
  dynamic argumentData = Get.arguments;
  String name = "";
  String email = "";
  String phone = "";
  String password = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  TextEditingController hospitaltextEdittingController =
      TextEditingController();
  TextEditingController licencenumbertextEdittingController =
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
    name = Get.parameters['name'].toString();
    email = Get.parameters['email'].toString();
    phone = Get.parameters['phone'].toString();
    password = Get.parameters['password'].toString();
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
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Verification",
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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
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
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        licencenumbertextEdittingController,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Licence Number required';
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
                                        hintText: "Licence Number:",
                                        hintStyle: TextStyle(
                                            fontFamily: "Sora",
                                            color: ColorConstant.primary)),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  DefaultButton(
                                    textonButton: "Verify",
                                    ontap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        startSpinner();
                                        //Do your jobs with the validated form data.

                                        var reg = await DrSignUp(context,
                                            email: email,
                                            password: password,
                                            phone: phone,
                                            name: name,
                                            hospital_name:
                                                hospitaltextEdittingController
                                                    .text,
                                            verification_no:
                                                licencenumbertextEdittingController
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
}
