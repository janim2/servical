import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/appointments.dart';

import '../../core/app_export.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  var status = false;

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
                                "Home",
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
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Appointments",
                            style: TextStyle(
                                fontFamily: "Sora",
                                fontSize: 25,
                                color: ColorConstant.primary),
                          ),
                        ),
                        FlutterSwitch(
                          width: 100.0,
                          height: 40.0,
                          valueFontSize: 20.0,
                          toggleSize: 45.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 8.0,
                          activeColor: ColorConstant.primary,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("appointments")
                        .snapshots(),
                    builder: (builder,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshots) {
                      var dataRef = snapshots.data;

                      if (snapshots.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return Text(
                          "Loading",
                          style: TextStyle(fontFamily: "Sora", fontSize: 15),
                        );
                      }

                      if (snapshots.data!.docs.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("No appointment",
                              style:
                                  TextStyle(fontFamily: "Sora", fontSize: 18)),
                        );
                      }

                      return Column(
                        children: [
                          for (int k = 0;
                              k <= snapshots.data!.docs.length - 1;
                              k++)
                            Container(
                                child: Appointments(
                                    image: "assets/images/profile.png",
                                    drname: "Mr. Henry",
                                    purpose_of_appointment:
                                        "Breast Examination")),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
