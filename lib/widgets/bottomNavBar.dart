// ignore_for_file: file_names, sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:servical/core/utils/color_constant.dart';
import 'package:servical/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:servical/presentation/login_screen/login_screen.dart';
import 'package:servical/presentation/signup_screen/signup_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/home_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/doctors_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/news_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/settings_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/user_dashboard_screen.dart';

import '../presentation/doctor_dashboard_screen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  // final GoogleSignInAccount user;

  const BottomNavBar();

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  Widget callPage(int currentTab) {
    switch (currentTab) {
      case 0:
        return UserHome();
      case 1:
        return UserDoctors();
      case 2:
        return UserNews();

      default:
        return UserSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentTab),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: MediaQuery.of(context).size.height * 1 / 10 - 20,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                          size: 35,
                          color: currentTab == 0
                              ? ColorConstant.primary
                              : Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentTab == 0
                                ? ColorConstant.primary
                                : Colors.grey,
                            fontSize: 12,
                            fontFamily: "Sora"),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_hospital,
                          size: 35,
                          color: currentTab == 1
                              ? ColorConstant.primary
                              : Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Doctors',
                        style: TextStyle(
                            color: currentTab == 1
                                ? ColorConstant.primary
                                : Colors.grey,
                            fontSize: 12,
                            fontFamily: "Sora"),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.speaker_phone,
                          size: 35,
                          color: currentTab == 2
                              ? ColorConstant.primary
                              : Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'News',
                        style: TextStyle(
                            color: currentTab == 2
                                ? ColorConstant.primary
                                : Colors.grey,
                            fontSize: 12,
                            fontFamily: "Sora"),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 3;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings,
                          size: 35,
                          color: currentTab == 3
                              ? ColorConstant.primary
                              : Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: currentTab == 3
                                ? ColorConstant.primary
                                : Colors.grey,
                            fontSize: 12,
                            fontFamily: "Sora"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// Bottom Navigation bar
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor:
      //         currentTab == 0 ? ColorConstant.primary : Colors.grey,
      //     onPressed: () {
      //       setState(() {
      //         currentTab = 0;
      //       });
      //     },
      //     child: const Icon(Icons.home))
    );
  }
}
