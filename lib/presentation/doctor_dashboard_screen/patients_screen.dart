import 'package:cloud_firestore/cloud_firestore.dart';
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
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
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

                            if (snapshots.data!.docs.length == 0) {
                              return Text("No users",
                                  style: TextStyle(
                                      fontFamily: "Sora", fontSize: 18));
                            }

                            return Column(
                              children: [
                                for (int k = 0;
                                    k <= snapshots.data!.docs.length - 1;
                                    k++)
                                  Container(
                                    child: Chats(
                                      image: "assets/images/avatar.jpg",
                                      drname: dataRef?.docs[k]['fullname'] == ""
                                          ? dataRef?.docs[k]['username']
                                          : dataRef?.docs[k]['fullname'],
                                      hospital_name: dataRef?.docs[k]['email'],
                                      ontap: () {
                                        String name =
                                            dataRef?.docs[k]['fullname'] == ""
                                                ? dataRef?.docs[k]['username']
                                                : dataRef?.docs[k]['fullname'];
                                        String phone =
                                            dataRef?.docs[k]['phone'];
                                        String user_id =
                                            dataRef?.docs[k]['user_id'];
                                        var data = {
                                          "name": name,
                                          "phone": phone,
                                          "user_id": user_id
                                        };
                                        Get.toNamed(AppRoutes.patientInfoRoute,
                                            parameters: data);
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
