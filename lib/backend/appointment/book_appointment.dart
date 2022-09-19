import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/services/SharedPreferences.dart';
import 'package:servical/routes/app_routes.dart';
import 'package:servical/widgets/toast.dart';

import '../../../core/app_export.dart';
import '../../core/helpers/functions.dart';

Future<String?> BookApointment(BuildContext context,
    {required DateTime date,
    required String purpose,
    required String doctor_id,
    required String doc_name,
    required String patient_name}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;

  String errorMessage = "";

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("appointments").doc(getAutoId());
  Map<String, dynamic> data = <String, dynamic>{
    "date": Timestamp.fromDate(date),
    "booked_date": currentTimestamp(),
    "purpose": purpose,
    "doctor_id": doctor_id,
    "doc_name": doc_name,
    "patient_name": patient_name,
    "patient_id": user_id
  };

  await documentReferencer
      .set(data)
      .then((value) => success())
      .catchError((e) => print(e));
}

success() {
  showToast("Appointment book successfully");
  Get.back();
}
