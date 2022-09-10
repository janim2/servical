import 'package:flutter/material.dart';

import '../core/app_export.dart';

class BoardedButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  final ontap;

  // ignore: sort_constructors_first
  BoardedButton({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(5),
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              border: Border.all(color: ColorConstant.primary)),
          child: Center(
              child: Text(
            "$textonButton",
            style: TextStyle(
                fontFamily: "Sora", fontSize: 20, color: ColorConstant.primary),
          ))),
    );
  }
}
