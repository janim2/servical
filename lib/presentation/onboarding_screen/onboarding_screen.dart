import 'package:flutter/material.dart';
import 'package:servical/core/services/SharedPreferences.dart';
import 'package:servical/presentation/onboarding_screen/onboarding_contents.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  List colors = [
    ColorConstant.grey,
    ColorConstant.grey,
    ColorConstant.grey,
    ColorConstant.grey
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: ColorConstant.primary,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/intro_1_top.png",
              fit: BoxFit.cover,
              width: size.width,
              height: 100,
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Container(
                    // color: colors[i],
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: size.height / 2.7,
                          ),
                          SizedBox(
                            height: (size.height >= 840) ? 60 : 30,
                          ),
                          // Text(
                          //   contents[i].title,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontFamily: "Sora",
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: (size.width <= 550) ? 30 : 35,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontFamily: "Sora",
                              color: ColorConstant.primary,
                              fontWeight: FontWeight.w300,
                              fontSize: (size.width <= 550) ? 17 : 25,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(index: index),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              addStringToSF("hasOnboarded", "true");
                              Get.toNamed(AppRoutes.loginRoute);
                            },
                            child: Text("START"),
                            style: ElevatedButton.styleFrom(
                              primary: ColorConstant.primary,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (size.width <= 550)
                                  ? EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: size.width * 0.2,
                                      vertical: 25),
                              textStyle: TextStyle(
                                  fontSize: (size.width <= 550) ? 13 : 17),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                child: Text(
                                  "SKIP",
                                  style:
                                      TextStyle(color: ColorConstant.primary),
                                ),
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (size.width <= 550) ? 13 : 17,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Text("NEXT"),
                                style: ElevatedButton.styleFrom(
                                  primary: ColorConstant.primary,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (size.width <= 550)
                                      ? EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize: (size.width <= 550) ? 13 : 17),
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
