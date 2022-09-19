import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

Future<String?> UpdateUserProfile(BuildContext context,
    {required String fullname,
    required String username,
    required String email,
    required String phone}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "fullname": fullname,
    "username": username,
    "email": email,
    "phone": phone,
  };

  await documentReferencer
      .update(data)
      .then((value) => success(fullname, username, email, phone))
      .catchError((e) => print(e));
}

success(String name, String username, String email, String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("fullname", name);
  prefs.setString("username", username);
  prefs.setString("email", email);
  prefs.setString("phone", phone);
  Get.back();
  showToast("Profile updated successful");
}
