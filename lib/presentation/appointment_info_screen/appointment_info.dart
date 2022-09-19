import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/notes.dart';
import 'package:unicons/unicons.dart';

import '../../core/app_export.dart';
import '../../core/helpers/functions.dart';

class AppointmentInfo extends StatefulWidget {
  const AppointmentInfo({Key? key}) : super(key: key);

  @override
  State<AppointmentInfo> createState() => _AppointmentInfoState();
}

class _AppointmentInfoState extends State<AppointmentInfo> {
  bool status = false;
  String patient_name = "";
  String purpose = "";
  String date = "";
  String patient_id = "";
  String phone = "";

  @override
  void initState() {
    patient_name = Get.parameters['name'].toString();
    purpose = Get.parameters['purpose'].toString();
    date = Get.parameters['date'].toString();
    patient_id = Get.parameters['patient_id'].toString();
    fetchPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var data = {
            "name": patient_name,
            "user_id": patient_id,
          };
          Get.toNamed(AppRoutes.writepatientNotesRoute, parameters: data);
        },
        backgroundColor: ColorConstant.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: ColorConstant.grey,
      body: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Image.asset(
                    //   "assets/images/curved_top.png",
                    //   // fit: BoxFit.contain,
                    //   width: size.width,
                    // ),
                    // Image.asset(
                    //   "assets/images/doc.png",
                    //   // fit: BoxFit.contain,
                    //   width: size.width,
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Icon(
                            UniconsLine.arrow_circle_left,
                            color: ColorConstant.primary,
                            size: 39,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 40),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 30.0, top: 110.0),
                    //     child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Text(
                    //         "Home",
                    //         style: TextStyle(
                    //             fontFamily: "Sora",
                    //             fontSize: 30,
                    //             color: ColorConstant.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(8),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                        child: Column(children: [
                      Text(
                        "Appointment Date",
                        style: TextStyle(
                            color: ColorConstant.primary,
                            fontFamily: "Sora",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            color: ColorConstant.primary,
                            fontFamily: "Sora",
                            fontSize: 15),
                      ),
                    ]))),
                Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(8),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                        child: Column(children: [
                      Text(
                        "Purpose",
                        style: TextStyle(
                            color: ColorConstant.primary,
                            fontFamily: "Sora",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        purpose,
                        style: TextStyle(
                            color: ColorConstant.primary,
                            fontFamily: "Sora",
                            fontSize: 15),
                      ),
                    ]))),
                Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(8),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                            child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Image.asset(
                              "assets/images/profile.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                        )),
                        Text(
                          patient_name,
                          style: TextStyle(
                              color: ColorConstant.primary,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Patient",
                          style: TextStyle(
                              color: ColorConstant.primary,
                              fontFamily: "Sora",
                              fontSize: 15),
                        ),

                        // FlutterSwitch(
                        //   width: 75.0,
                        //   height: 50.0,
                        //   valueFontSize: 55.0,
                        //   toggleSize: 65.0,
                        //   value: status,
                        //   borderRadius: 30.0,
                        //   padding: 8.0,
                        //   showOnOff: true,
                        //   onToggle: (val) {
                        //     setState(() {
                        //       status = val;
                        //     });
                        //   },
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   UniconsLine.facebook_f,
                            //   size: 35,
                            //   color: ColorConstant.primary,
                            // ),
                            InkWell(
                              onTap: () {
                                launchWhatsapp(context, phone);
                              },
                              child: Icon(
                                UniconsLine.whatsapp,
                                size: 35,
                                color: ColorConstant.primary,
                              ),
                            )
                          ],
                        ),
                      ],
                    ))),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Notes",
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Sora", fontSize: 14),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("notes")
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
                        return Text("No notes",
                            style: TextStyle(fontFamily: "Sora", fontSize: 18));
                      }

                      return Column(
                        children: [
                          for (int k = 0;
                              k <= snapshots.data!.docs.length - 1;
                              k++)
                            if (dataRef?.docs[k]['user_id'] == patient_id)
                              Container(
                                child: Notes(
                                  text: dataRef?.docs[k]['notes'],
                                  ontap: () {
                                    String notes = dataRef?.docs[k]['notes'];
                                    Timestamp date = dataRef?.docs[k]['date'];
                                    String thedate =
                                        dateFormat(date).toString();
                                    var data = {
                                      "name": patient_name,
                                      "user_id": patient_id,
                                      "note": notes,
                                      "date": thedate
                                    };
                                    Get.toNamed(AppRoutes.patientNotesRoute,
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
        ),
      ),
    );
  }

  Future<void> fetchPhone() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(patient_id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        setState(() {
          phone = documentSnapshot.get("phone").toString();
        });
      });
    } on FormatException catch (e) {}
  }
}
