import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';

import '../../../core/app_export.dart';

Future<String?> DrSignUp(BuildContext context,
    {required String email,
    required String password,
    required String phone,
    required String name,
    required String hospital_name,
    required String verification_no}) async {
  String errorMessage = "";
  String user_id = "";

  try {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    user_id = result.user!.uid;

    var userAdd = await addUser("", user_id, hospital_name, email, password,
        phone, name, verification_no);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "invalid-email":
        errorMessage = "Your email appears to be malformed.";
        break;
      case "email-already-in-use":
        errorMessage = "Email already exists.";
        break;
      case "unknown":
        errorMessage = "Something unexcepted happened";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return (errorMessage);
  }
}

addUser(
    String profile_image,
    String user_id,
    String hospital_name,
    String email,
    String password,
    String phone,
    String name,
    String verification_no) async {
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("doctors").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "image": profile_image.isEmpty ? "" : profile_image,
    "user_id": user_id,
    "hospital": hospital_name,
    "fullname": name,
    "user_type": "doctor",
    "verification_no": verification_no,
    "isVerified": 0,
    "isAvailable": 0,
    "phone": phone,
    "email": email,
  };

  await documentReferencer
      .set(data)
      .then((value) => success())
      .catchError((e) => print(e));
}

success() {
  showToast("Sign In to Continue");
  Get.offNamedUntil(AppRoutes.doctorloginRoute, (route) => false);
}
