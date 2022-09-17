import 'dart:async';

import 'package:servical/core/services/SharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          userType == "doctor") ;
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
}
