import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/bordered_button.dart';
import 'package:servical/widgets/button.dart';

import '../../core/app_export.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.grey,
      body: Container(
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
                    Icon(Icons.arrow_circle_left_outlined),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 110.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Settings",
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
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      BoardedButton(textonButton: "Recent Appointments"),
                      SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        textonButton: "Logout",
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
