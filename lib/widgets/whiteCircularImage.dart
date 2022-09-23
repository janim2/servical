import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_export.dart';

class WhiteCircularImage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  String org_name;
  String link;

  // ignore: sort_constructors_first
  WhiteCircularImage(
      {required this.image, required this.org_name, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _launchURL(link);
        },
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ))),
            Text(
              org_name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Sora",
                  color: ColorConstant.primary,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

_launchURL(String link) async {
  var url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2(String link) async {
  if (!await canLaunch(link)) {
    await launch(
      link,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $link';
  }
}
