import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_export.dart';

Future<String?> Logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    // await FirebaseAuth.instance.signOut().then((value) => () {
    prefs.clear();
    // prefs.setString("hasOnboarded", "false");
    // prefs.setString("hasLoggedin", "false");
    Get.offNamedUntil(AppRoutes.initialRoute, (route) => false);
    // });
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}
