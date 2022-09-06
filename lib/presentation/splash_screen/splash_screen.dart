import 'controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: ColorConstant.primary,
            body: Container(
              width: size.width,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: size.height,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 250,
                              width: 250,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
