import 'package:get/get.dart';
import 'package:servical/presentation/doctor_login_screen/binding/doctor_login_screen_binding.dart';
import 'package:servical/presentation/doctor_login_screen/doctor_login_screen.dart';
import 'package:servical/presentation/doctor_signup_screen/doctor_signup_screen.dart';
import 'package:servical/presentation/doctor_verification_screen/binding/doctor_verification_screen_binding.dart';
import 'package:servical/presentation/doctor_verification_screen/doctor_verification_screen.dart';
import 'package:servical/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:servical/presentation/signup_screen/binding/signup_screen_binding.dart';
import 'package:servical/presentation/signup_screen/signup_screen.dart';

import '../presentation/forgot_password_screen/binding/forgot_password_screen_binding.dart';
import '../presentation/login_screen/binding/login_screen_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';

  static String loginRoute = '/loginRoute';

  static String forgotPasswordRoute = '/forgotPasswordRoute';

  static String signupRoute = '/signupRoute';

  //DOCTOR

  static String doctorloginRoute = '/doctorloginRoute';

  static String doctorSignupRoute = '/doctorSignupRoute';

  static String doctorVerificationRoute = '/doctorVerificationRoute';

  static List<GetPage> pages = [
    GetPage(
      name: doctorVerificationRoute,
      page: () => DoctorVerificationScreen(),
      bindings: [
        DoctorVerificationScreenBinding(),
      ],
    ),
    GetPage(
      name: doctorSignupRoute,
      page: () => DoctorSignUpScreen(),
      bindings: [
        DoctorLoginScreenBinding(),
      ],
    ),
    GetPage(
      name: signupRoute,
      page: () => SignUpScreen(),
      bindings: [
        SignUpScreenBinding(),
      ],
    ),
    GetPage(
      name: doctorloginRoute,
      page: () => DoctorLoginScreen(),
      bindings: [
        DoctorLoginScreenBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordRoute,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordScreenBinding(),
      ],
    ),
    GetPage(
      name: loginRoute,
      page: () => LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    )
  ];
}
