import '../../widgets/bottomNavBar.dart';
import '../../widgets/button.dart';
import 'controller/user_dashboard_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class UserDashboardScreen extends GetWidget<UserDashboardScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
              // backgroundColor: ColorConstant.white,
              bottomNavigationBar: const BottomNavBar(),
              body: Text("")),
        ],
      ),
    );
  }
}
