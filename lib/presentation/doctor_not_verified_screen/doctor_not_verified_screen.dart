import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/backend/auth/logout.dart';
import 'package:servical/widgets/bordered_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/auth/doc/signup.dart';
import '../../widgets/button.dart';
import '../../widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

import '../splash_screen/controller/splash_screen_controller.dart';

class DoctorNotVerifiedScreen extends StatefulWidget {
  const DoctorNotVerifiedScreen({Key? key}) : super(key: key);

  @override
  _DoctorNotVerifiedScreenState createState() =>
      _DoctorNotVerifiedScreenState();
}

class _DoctorNotVerifiedScreenState extends State<DoctorNotVerifiedScreen> {
  dynamic argumentData = Get.arguments;
  String name = "";

  bool showSpinner = false;

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: ColorConstant.primary,
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
                              "assets/images/logo.png",
                              // fit: BoxFit.contain,
                              height: 200,
                              width: size.width,
                            ),
                          ],
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Hi Dr.",
                              style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 20,
                                  color: ColorConstant.white),
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Your account is being verified. You will be redirected to the app after verification is complete.",
                                    style: TextStyle(
                                        fontFamily: "Sora",
                                        fontSize: 20,
                                        color: ColorConstant.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "For immediate attention, contact customer care on +233542143029",
                                    style: TextStyle(
                                        fontFamily: "Sora",
                                        fontSize: 20,
                                        color: ColorConstant.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                BoardedButtonWhite(
                                  textonButton: "Retry",
                                  ontap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    startSpinner();
                                    FetchDocDetails(
                                        prefs.getString("user_id").toString());
                                    stopSpinner();
                                  },
                                ),
                                BoardedButtonWhite(
                                  textonButton: "Login as new user",
                                  ontap: () {
                                    Logout(context);
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
          ),
        ],
      ),
    );
  }
}
