import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:servical/widgets/button.dart';
import 'package:servical/widgets/chats.dart';
import 'package:servical/widgets/notes.dart';
import 'package:unicons/unicons.dart';

import '../../backend/notes/WriteNote.dart';
import '../../core/app_export.dart';
import '../../core/helpers/functions.dart';
import '../../widgets/toast.dart';

class WritePatientsNotes extends StatefulWidget {
  const WritePatientsNotes({Key? key}) : super(key: key);

  @override
  State<WritePatientsNotes> createState() => _WritePatientsNotesState();
}

class _WritePatientsNotesState extends State<WritePatientsNotes> {
  String name = "";
  String user_id = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  TextEditingController notestextEdittingController = TextEditingController();

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  void initState() {
    name = Get.parameters["name"].toString();
    user_id = Get.parameters["user_id"].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.grey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
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
                          Get.back();
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
                            name,
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
                            dateFormat(currentTimestamp()),
                            style: TextStyle(
                                fontFamily: "Sora",
                                fontSize: 11,
                                color: ColorConstant.primary),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: notestextEdittingController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    // border: const OutlineInputBorder(
                                    //   borderRadius: BorderRadius.all(
                                    //     Radius.circular(50.0),
                                    //   ),
                                    // ),

                                    // hintStyle: textfield_hint_style,
                                    hintText: "Write notes here:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Sora",
                                        color: ColorConstant.primary)),
                                maxLines: 8,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Note required';
                                  }
                                },
                                style: TextStyle(
                                    color: ColorConstant.primary,
                                    fontFamily: "Sora"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultButton(
                                textonButton: "Save",
                                ontap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    var reg = await WriteNote(
                                      context,
                                      note: notestextEdittingController.text,
                                      user_id: user_id,
                                    );
                                    if (reg != null) {
                                      stopSpinner();
                                      showAlert(
                                          context, "error", reg.toString(), () {
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  }
                                },
                              )
                            ],
                          ),
                        ),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     "Lorem lorem n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without",
                        //     style: TextStyle(
                        //         color: ColorConstant.primary, fontFamily: "Sora"),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
