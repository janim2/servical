import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/widgets/chats.dart';
import 'package:servical/widgets/notes.dart';
import 'package:unicons/unicons.dart';

import '../../core/app_export.dart';

class PatientsNotes extends StatefulWidget {
  const PatientsNotes({Key? key}) : super(key: key);

  @override
  State<PatientsNotes> createState() => _PatientsNotesState();
}

class _PatientsNotesState extends State<PatientsNotes> {
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Icon(
                            UniconsLine.arrow_circle_left,
                            color: ColorConstant.primary,
                            size: 39,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "John Doe",
                          style: TextStyle(
                              fontFamily: "Sora",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.primary),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "10th September, 2020",
                          style: TextStyle(
                              fontFamily: "Sora",
                              fontSize: 11,
                              color: ColorConstant.primary),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem lorem n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without",
                          style: TextStyle(
                              color: ColorConstant.primary, fontFamily: "Sora"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
