import 'package:flutter/material.dart';

import '../core/app_export.dart';

class Chats extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  String drname;
  String hospital_name;
  final ontap;

  // ignore: sort_constructors_first
  Chats(
      {required this.image,
      required this.drname,
      required this.hospital_name,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(5),
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRect(child: Image.asset(image)),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drname,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorConstant.primary,
                        fontFamily: "Sora"),
                  ),
                  Text(
                    hospital_name,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorConstant.primary,
                        fontFamily: "Sora"),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
