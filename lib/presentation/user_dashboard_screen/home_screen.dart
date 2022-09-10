import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/appointments.dart';

import '../../core/app_export.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 110.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Home",
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
                    image: "assets/images/doctor.png",
                    drname: "Dr. John Doe",
                    purpose_of_appointment: "Breast Examination")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
