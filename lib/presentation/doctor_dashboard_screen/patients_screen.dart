import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/chats.dart';

import '../../core/app_export.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
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
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Patients",
                            style: TextStyle(
                                fontFamily: "Sora",
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Chats(
                        image: "assets/images/profile.png",
                        drname: "Mr. Amoah",
                        hospital_name: "Breast Examination",
                        ontap: () {
                          Get.toNamed(AppRoutes.patientInfoRoute);
                        },
                      ),
                      Chats(
                        image: "assets/images/profile.png",
                        drname: "Mr. Amoah",
                        hospital_name: "Breast Examination",
                        ontap: () {
                          Get.toNamed(AppRoutes.doctorInfoRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
