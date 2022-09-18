import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/services/SharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/toast.dart';
import '/core/app_export.dart';
import 'package:servical/presentation/splash_screen/models/splash_model.dart';

class SplashScreenController extends GetxController {
  Rx<SplashModel> splashOneModelObj = SplashModel().obs;

  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hasOnboarded = prefs.getString("hasOnboarded");
    var hasLogedin = prefs.getString("hasLoggedin");
    var userType = prefs.getString("userType");
    var isVerified = prefs.getString("isVerified");
    var user_id = prefs.getString("user_id");

    // print(hasOnboarded);
    // print(hasLogedin);
    // print(userType);
    // print(isVerified);
    // print(user_id);

    var _duration = new Duration(seconds: 4);
    return Timer(_duration, () {
      if (hasOnboarded != "true" && hasLogedin != "true") {
        Get.toNamed(AppRoutes.onboardingRoute);
      } else if (hasOnboarded == "true" && hasLogedin != "true") {
        Get.toNamed(AppRoutes.loginRoute);
      } else if (hasOnboarded == "true" &&
          hasLogedin == "true" &&
          userType == "user") {
        Get.toNamed(AppRoutes.userDashboadRoute);
      } else if (hasOnboarded == "true" &&
          hasLogedin == "true" &&
          userType == "doctor" &&
          isVerified == "0") {
        //CHECK IF DOC IS VERIFIED
        FetchDocDetails(user_id.toString());
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future FetchDocDetails(String user_id) async {
    print("fetching");

    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(user_id)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      // print(documentSnapshot.data().toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //save to shared preference
      if (documentSnapshot.get("isVerified") == 0) {
        Get.offNamedUntil(AppRoutes.doctorNotVerifiedRoute, (route) => false);
      } else {
        prefs.setString(
            "isVerified", documentSnapshot.get("isVerified").toString());
        Get.offNamedUntil(AppRoutes.doctorDashboadRoute, (route) => false);
        showToast("Welcome to Servical");
      }
    });
  }
}
