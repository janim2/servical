import 'package:flutter/material.dart';

import '../core/app_export.dart';

class Appointments extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  String drname;
  String purpose_of_appointment;
  final ontap;

  // ignore: sort_constructors_first
  Appointments(
      {required this.image,
      required this.drname,
      required this.purpose_of_appointment,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(25),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                    purpose_of_appointment,
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorConstant.primary,
                        fontFamily: "Sora"),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(3),
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorConstant.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "1st January",
                    style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 13,
                        color: ColorConstant.white),
                  ))),
            ],
          )),
    );
  }
}
