import 'package:flutter/material.dart';
class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "",
    image: "assets/images/intro_1.png",
    desc: "A highly medical patient-doctor interaction platform.",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/intro_2.png",
    desc:
        "An anonymous profile which will help protect the identity of patient",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/intro_3.png",
    desc: "A friendly doctor to interact with patient on their cervical issues",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/intro_4.png",
    desc:
        "An online community to share ideas related to Cervical Cancer issues",
  ),
];
