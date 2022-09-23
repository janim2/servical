import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:unicons/unicons.dart';

import '../../backend/auth/doc/signup.dart';
import '../../widgets/button.dart';
import '../../widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            // fit: BoxFit.contain,
                            height: 200,
                            width: size.width,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Icon(
                                  UniconsLine.arrow_circle_left,
                                  color: ColorConstant.white,
                                  size: 39,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Servical 1.0",
                            style: TextStyle(
                                fontFamily: "Sora",
                                fontSize: 20,
                                color: ColorConstant.white),
                          ),
                        ),
                      ),
                      Container(
                          height: size.height,
                          width: size.width,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Julia Eugenia Opintan \n 3930718",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 20,
                                      color: ColorConstant.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Holibab Josephine Ayettey \n 3923618",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 20,
                                      color: ColorConstant.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Isaac Kwaku Duah \n 3926318",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 20,
                                      color: ColorConstant.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Amanda Maame Efua Owusu \n 3931318",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 20,
                                      color: ColorConstant.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Rachel Ohene-Nyako \n 3930518",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 20,
                                      color: ColorConstant.white),
                                ),
                              ),
                            ],
                          ))
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
