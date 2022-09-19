import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/backend/auth/logout.dart';
import 'package:servical/widgets/bordered_button.dart';
import 'package:servical/widgets/button.dart';

import '../../core/app_export.dart';

class DocSettings extends StatefulWidget {
  const DocSettings({Key? key}) : super(key: key);

  @override
  State<DocSettings> createState() => _DocSettingsState();
}

class _DocSettingsState extends State<DocSettings> {
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
                                "Settings",
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
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      BoardedButton(
                        textonButton: "Profile",
                        ontap: () {
                          Get.toNamed(AppRoutes.profileRoute);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BoardedButton(
                        textonButton: "About",
                        ontap: () {
                          Get.toNamed(AppRoutes.aboutRoute);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        textonButton: "Logout",
                        color: Colors.red,
                        ontap: () {
                          Logout(context);
                        },
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
