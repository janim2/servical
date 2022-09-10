import 'package:flutter/material.dart';

import '../core/app_export.dart';

class WhiteCircularImage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  final ontap;

  // ignore: sort_constructors_first
  WhiteCircularImage({required this.image, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
            margin: EdgeInsets.all(5),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: ColorConstant.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Center(
                child: Image.asset(
              image,
              fit: BoxFit.contain,
            )))
            );
  }
}
