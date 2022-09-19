import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';

import '../../../core/app_export.dart';
import '../../core/helpers/functions.dart';

Future<String?> WriteNote(BuildContext context,
    {required String note, required String user_id}) async {
  String errorMessage = "";

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("notes").doc(getAutoId());

  Map<String, dynamic> data = <String, dynamic>{
    "notes": note,
    "date": currentTimestamp(),
    "user_id": user_id,
  };

  await documentReferencer
      .set(data)
      .then((value) => success())
      .catchError((e) => print(e));
}

success() {
  showToast("Note added");
  Get.back();
}
