import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/backend/approval/approve_doctor.dart';
import 'package:unicons/unicons.dart';

import '../../backend/auth/doc/signup.dart';
import '../../widgets/button.dart';
import '../../widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class VerifyADocScreen extends StatefulWidget {
  const VerifyADocScreen({Key? key}) : super(key: key);

  @override
  _VerifyADocScreenState createState() => _VerifyADocScreenState();
}

class _VerifyADocScreenState extends State<VerifyADocScreen> {
  String name = "";

  bool showSpinner = false;

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: ColorConstant.primary,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Container(
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
                              "assets/images/logo.png",
                              // fit: BoxFit.contain,
                              height: 200,
                              width: size.width,
                            ),
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
                                    color: ColorConstant.white,
                                    size: 39,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Doctors that need approval",
                              style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 20,
                                  color: ColorConstant.white),
                            ),
                          ),
                        ),
                        Container(
                            height: size.height,
                            width: size.width,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Column(
                              children: [
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("doctors")
                                        .snapshots(),
                                    builder: (builder,
                                        AsyncSnapshot<
                                                QuerySnapshot<
                                                    Map<String, dynamic>>>
                                            snapshots) {
                                      var dataRef = snapshots.data;

                                      if (snapshots.hasError) {
                                        return Text('Something went wrong');
                                      }

                                      if (snapshots.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
                                          "Loading",
                                          style: TextStyle(
                                              fontFamily: "Sora", fontSize: 15),
                                        );
                                      }

                                      if (snapshots.data!.docs.length == 0) {
                                        return Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text("No doctors",
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  fontSize: 18)),
                                        );
                                      }

                                      return Column(
                                        children: [
                                          for (int k = 0;
                                              k <=
                                                  snapshots.data!.docs.length -
                                                      1;
                                              k++)
                                            if (dataRef?.docs[k]
                                                    ['isVerified'] ==
                                                0)
                                              InkWell(
                                                onTap: () {
                                                  showTwoButtonAlertDialog(
                                                      context,
                                                      "Approve Dr.",
                                                      "Are you sure you want to approve ${dataRef?.docs[k]['fullname']}?. Action cannot be undone",
                                                      "No",
                                                      "Yes", () {
                                                    Get.back();
                                                  }, () {
                                                    approveDoc(context,
                                                        doc_id: dataRef?.docs[k]
                                                            ['user_id']);
                                                  });
                                                },
                                                child: Container(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(25),
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorConstant.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                      ),
                                                      child: Center(
                                                          child:
                                                              Column(children: [
                                                        Text(
                                                          dataRef?.docs[k]
                                                              ['fullname'],
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .primary,
                                                              fontFamily:
                                                                  "Sora",
                                                              fontSize: 15),
                                                        ),
                                                      ]))),
                                                ),
                                              ),
                                        ],
                                      );
                                    }),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
