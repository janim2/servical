import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

Future<String?> isAvailable(BuildContext context,
    {required bool status}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;
  int theStatus = 0;

  if (status == true) {
    theStatus = 1;
  } else {
    theStatus = 0;
  }
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("doctors").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "isAvailable": theStatus,
  };

  await documentReferencer
      .update(data)
      .then((value) => success(theStatus))
      .catchError((e) => print(e));
}

success(int status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("isAvailable", status.toString());
  Get.back();
  if (status == 1) {
    showToast("You are now available");
  } else {
    showToast("You are unavailable");
  }
}
