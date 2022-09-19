import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

Future<String?> approveDoc(BuildContext context,
    {required String doc_id}) async {
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("doctors").doc(doc_id);

  Map<String, dynamic> data = <String, dynamic>{
    "isVerified": 1,
  };

  await documentReferencer
      .update(data)
      .then((value) => success())
      .catchError((e) => print(e));
}

success() async {
  showToast("Doctor verified");
  Get.back();
}
