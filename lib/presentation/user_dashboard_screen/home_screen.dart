import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/appointments.dart';

import '../../core/app_export.dart';
import '../../core/helpers/functions.dart';
import '../../widgets/chats.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

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
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("appointments")
                        .orderBy("date", descending: false)
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
                          padding: const EdgeInsets.all(29.0),
                          child: Text("No appointments",
                              style:
                                  TextStyle(fontFamily: "Sora", fontSize: 18)),
                        );
                      }

                      return Column(
                        children: [
                          for (int k = 0;
                              k <= snapshots.data!.docs.length - 1;
                              k++)
                            if (dataRef?.docs[k]['patient_id'] ==
                                currentUser!.uid.toString())
                              Container(
                                  child: Appointments(
                                      image: "assets/images/doctor.png",
                                      drname: dataRef?.docs[k]['doc_name'],
                                      purpose_of_appointment: dataRef?.docs[k]
                                          ['purpose'],
                                      date: dataRef?.docs[k]['date'])),
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
