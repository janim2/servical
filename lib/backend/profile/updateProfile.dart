import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

Future<String?> UpdateProfile(BuildContext context,
    {required String email,
    required String phone,
    required String name,
    required String hospital_name}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("doctors").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "hospital": hospital_name,
    "fullname": name,
    "phone": phone,
    "email": email,
  };

  await documentReferencer
      .update(data)
      .then((value) => success(name, phone, hospital_name, email))
      .catchError((e) => print(e));
}

success(String name, String phone, String hospital, String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString("phonenumber", phone);
  prefs.setString("hospital", hospital);
  prefs.setString("email", email);
  Get.back();
  showToast("Profile updated successful");
}
