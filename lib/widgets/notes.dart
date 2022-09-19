import 'package:flutter/material.dart';

import '../core/app_export.dart';

class Notes extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String text;
  final ontap;

  // ignore: sort_constructors_first
  Notes({required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 10),
          width: size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Center(
              child: Column(
            children: [
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: ColorConstant.primary,
                    fontFamily: "Sora",
                    fontSize: 15),
              ),
            ],
          ))),
    );
  }
}
