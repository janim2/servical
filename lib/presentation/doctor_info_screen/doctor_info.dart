import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../core/app_export.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  bool status = false;

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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                    // Container(
                    //   margin: EdgeInsets.only(left: 40),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 30.0, top: 110.0),
                    //     child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Text(
                    //         "Home",
                    //         style: TextStyle(
                    //             fontFamily: "Sora",
                    //             fontSize: 30,
                    //             color: ColorConstant.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                    child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(
                      "assets/images/doctor.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                )),
                Container(
                    margin: EdgeInsets.all(25),
                    width: size.width,
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
                          "Dr John Doe",
                          style: TextStyle(
                              color: ColorConstant.primary,
                              fontFamily: "Sora",
                              fontSize: 20),
                        ),
                        Text(
                          "Akonfo Anokye Hospital",
                          style: TextStyle(
                              color: ColorConstant.primary,
                              fontFamily: "Sora",
                              fontSize: 15),
                        ),
                        Text(
                          "Active",
                          style: TextStyle(
                              color: Colors.black45,
                              fontFamily: "Sora",
                              fontSize: 12),
                        ),
                        // FlutterSwitch(
                        //   width: 75.0,
                        //   height: 50.0,
                        //   valueFontSize: 55.0,
                        //   toggleSize: 65.0,
                        //   value: status,
                        //   borderRadius: 30.0,
                        //   padding: 8.0,
                        //   showOnOff: true,
                        //   onToggle: (val) {
                        //     setState(() {
                        //       status = val;
                        //     });
                        //   },
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              UniconsLine.facebook_f,
                              size: 35,
                              color: ColorConstant.primary,
                            ),
                            Icon(
                              UniconsLine.whatsapp,
                              size: 35,
                              color: ColorConstant.primary,
                            )
                          ],
                        )
                      ],
                    ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
