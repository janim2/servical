import 'dart:async';

import 'package:flutter/material.dart';

import '/core/app_export.dart';
import 'package:servical/presentation/splash_screen/models/splash_model.dart';

class UserProfileScreenController extends GetxController {
  bool isloading = false;

  void isLoading() {
    isloading = true;
    update();
  }

  void isNotLoading() {
    isloading = false;
    update();
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
