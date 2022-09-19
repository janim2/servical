import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/chats.dart';

import '../../core/app_export.dart';

class UserDoctors extends StatefulWidget {
  const UserDoctors({Key? key}) : super(key: key);

  @override
  State<UserDoctors> createState() => _UserDoctorsState();
}

class _UserDoctorsState extends State<UserDoctors> {
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
                            "Doctors",
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
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("doctors")
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
                                style:
                                    TextStyle(fontFamily: "Sora", fontSize: 15),
                              );
                            }
                            print(snapshots.data!.docs.length == 0);
                            if (snapshots.data!.docs.length == 0) {
                              return Text("No available doctors",
                                  style: TextStyle(
                                      fontFamily: "Sora", fontSize: 18));
                            }

                            return Column(
                              children: [
                                for (int k = 0;
                                    k <= snapshots.data!.docs.length - 1;
                                    k++)
                                  if (dataRef?.docs[k]['isAvailable'] == 1)
                                    Container(
                                      child: Chats(
                                        image: "assets/images/doctor.png",
                                        drname: "Jesse Anim",
                                        hospital_name: "Aponfo Anokye Hospital",
                                        ontap: () {
                                          Get.toNamed(
                                              AppRoutes.doctorInfoRoute);
                                        },
                                      ),
                                    ),
                              ],
                            );
                          }),
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
