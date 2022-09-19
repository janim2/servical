import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servical/backend/appointment/book_appointment.dart';
import 'package:servical/core/helpers/functions.dart';
import 'package:servical/widgets/bordered_button.dart';
import 'package:servical/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart';

import '../../core/app_export.dart';
import '../../widgets/toast.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  bool status = false;
  String name = "";
  String doctor_id = "";
  String hospital = "";
  String phone = "";
  String patient_name = "";

  TextEditingController purposetextEdittingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  bool showSpinner = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
  initState() {
    fetchValues();
    super.initState();
  }

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
                        Get.back();
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
                    padding: EdgeInsets.all(8),
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
                          name,
                          style: TextStyle(
                              color: ColorConstant.primary,
                              fontFamily: "Sora",
                              fontSize: 20),
                        ),
                        Text(
                          hospital,
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
                            // Icon(
                            //   UniconsLine.facebook_f,
                            //   size: 35,
                            //   color: ColorConstant.primary,
                            // ),
                            InkWell(
                              onTap: () {
                                launchWhatsapp(context, phone);
                              },
                              child: Icon(
                                UniconsLine.whatsapp,
                                size: 35,
                                color: ColorConstant.primary,
                              ),
                            )
                          ],
                        ),
                      ],
                    ))),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: BoardedButton(
                        textonButton: "Book Apointment",
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 16,
                                child: Form(
                                  key: _formKey,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        Center(
                                            child: Text(
                                          'Book Apointment',
                                          style: TextStyle(
                                              fontFamily: "Sora", fontSize: 18),
                                        )),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "Date",
                                            style:
                                                TextStyle(fontFamily: "Sora"),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 17.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              _selectDate(context);
                                            },
                                            child: Text(
                                              "${selectedDate.toLocal()}"
                                                  .split(' ')[0],
                                              style: TextStyle(
                                                  fontFamily: "Sora",
                                                  color: ColorConstant.primary),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12.0, left: 12.00),
                                          child: Text(
                                            "Purpose",
                                            style: TextStyle(
                                                fontFamily: "Sora",
                                                color: Colors.black),
                                          ),
                                        ),
                                        TextFormField(
                                          controller:
                                              purposetextEdittingController,
                                          keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(20.0),
                                              // border: const OutlineInputBorder(
                                              //   borderRadius: BorderRadius.all(
                                              //     Radius.circular(50.0),
                                              //   ),
                                              // ),

                                              // hintStyle: textfield_hint_style,
                                              hintText: "Write purpose here:",
                                              hintStyle: TextStyle(
                                                  fontFamily: "Sora",
                                                  color:
                                                      ColorConstant.primary)),
                                          maxLines: 2,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Purpose required';
                                            }
                                          },
                                          style: TextStyle(
                                              color: ColorConstant.primary,
                                              fontFamily: "Sora"),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        DefaultButton(
                                          textonButton: "Book",
                                          ontap: () async {
                                            startSpinner();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              var reg = await BookApointment(
                                                  context,
                                                  date: selectedDate,
                                                  purpose:
                                                      purposetextEdittingController
                                                          .text,
                                                  doctor_id: doctor_id,
                                                  doc_name: name,
                                                  patient_name: patient_name);
                                              if (reg != null) {
                                                stopSpinner();
                                                showAlert(context, "error",
                                                    reg.toString(), () {
                                                  Navigator.of(context).pop();
                                                });
                                              }
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      patient_name = prefs.getString("username").toString();
      name = Get.parameters['name'].toString();
      doctor_id = Get.parameters['user_id'].toString();
      hospital = Get.parameters['hospital'].toString();
      phone = Get.parameters['phone'].toString();
    });
  }
}
