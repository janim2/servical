import 'package:flutter/material.dart';
import 'package:servical/core/helpers/functions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_export.dart';

class VideosCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String thumbnil;
  String title;
  String link;

  // ignore: sort_constructors_first
  VideosCard({required this.thumbnil, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          LaunchURL(link);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(children: [
            Image.asset(thumbnil),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: ColorConstant.primary, fontFamily: "Sora"),
                ),
              ),
            )
          ]),
        ));
  }
}
