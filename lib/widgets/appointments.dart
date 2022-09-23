import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servical/core/helpers/functions.dart';

import '../core/app_export.dart';

class Appointments extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  String drname;
  String purpose_of_appointment;
  Timestamp date;
  final ontap;

  // ignore: sort_constructors_first
  Appointments(
      {required this.image,
      required this.drname,
      required this.purpose_of_appointment,
      required this.date,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(15),
          width: size.width,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRect(
                  child: Image.asset(
                image,
                height: 70,
                width: 70,
              )),
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
                  SizedBox(
                    width: size.width / 1.5,
                    child: Text(
                      purpose_of_appointment,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          color: ColorConstant.primary,
                          fontFamily: "Sora"),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: ColorConstant.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        dateFormat(date),
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Sora",
                            fontSize: 12,
                            color: ColorConstant.white),
                      ))),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )),
    );
  }
}
