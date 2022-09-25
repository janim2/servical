import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/widgets/videos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart';
import '../../backend/profile/updateProfile.dart';
import '../../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/app_export.dart';

import '../../widgets/toast.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            // backgroundColor: ColorConstant.white,
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
                            "assets/images/curved_top.png",
                            // fit: BoxFit.contain,
                            width: size.width,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: Icon(
                                UniconsLine.arrow_circle_left,
                                color: ColorConstant.white,
                                size: 39,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 110.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                      fontFamily: "Sora",
                                      fontSize: 30,
                                      color: ColorConstant.white),
                                ),
                              ),
                            ),
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
                          height: size.height,
                          width: size.width,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              VideosCard(
                                  thumbnil: "assets/images/videos/whatis.jpg",
                                  title:
                                      "What is Cervical Cancer? - Joshua G. Cohen",
                                  link:
                                      "https://www.youtube.com/watch?v=CVj19sMBuds"),
                              VideosCard(
                                  thumbnil:
                                      "assets/images/videos/treatment.jpg",
                                  title:
                                      "Treatment of Cervical Cancer? - Joshua G. Cohen",
                                  link:
                                      "https://www.youtube.com/watch?v=I_uJAXZ-_ow"),
                              VideosCard(
                                  thumbnil: "assets/images/videos/hpv.jpg",
                                  title:
                                      "Heidi's Story: HPV and Cervial Cancer",
                                  link:
                                      "https://www.youtube.com/watch?v=DvB12NdKm24"),
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
