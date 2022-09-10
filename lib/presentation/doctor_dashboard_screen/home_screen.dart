import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/appointments.dart';

import '../../core/app_export.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
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
                            "Home",
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
                  margin: EdgeInsets.only(left: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 25,
                            color: ColorConstant.primary),
                      ),
                    ),
                  ),
                ),
                Appointments(
                    image: "assets/images/profile.png",
                    drname: "Mr. Henry",
                    purpose_of_appointment: "Breast Examination")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
