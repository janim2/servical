import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/whiteCircularImage.dart';

import '../../core/app_export.dart';

class UserNews extends StatefulWidget {
  const UserNews({Key? key}) : super(key: key);

  @override
  State<UserNews> createState() => _UserNewsState();
}

class _UserNewsState extends State<UserNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.grey,
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
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 110.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "News",
                            style: TextStyle(
                                fontFamily: "Sora",
                                fontSize: 30,
                                color: ColorConstant.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            WhiteCircularImage(
                              image: "assets/images/news/who.png",
                              org_name: "WHO",
                              link: "https://www.who.int/",
                            ),
                            WhiteCircularImage(
                              image: "assets/images/news/bbc.png",
                              org_name: "BBC",
                              link: "https://www.bbc.co.uk/news/health",
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            width: 2,
                            height: 300,
                            decoration: BoxDecoration(
                              color: ColorConstant.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child: Text('')),
                        Column(
                          children: [
                            WhiteCircularImage(
                              image: "assets/images/news/cnn.png",
                              org_name: "CNN",
                              link: "https://www.cnn.com/health",
                            ),
                            WhiteCircularImage(
                              image: "assets/images/news/science_daily.png",
                              org_name: "Science Daily",
                              link:
                                  "https://www.sciencedaily.com/news/top/health/",
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
