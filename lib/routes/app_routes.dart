import 'package:get/get.dart';
import 'package:servical/presentation/about_screen/about_screen.dart';
import 'package:servical/presentation/about_screen/binding/about_screen_binding.dart';
import 'package:servical/presentation/appointment_info_screen/appointment_info.dart';
import 'package:servical/presentation/appointment_info_screen/controller/apoointment_info_screen_controller.dart';
import 'package:servical/presentation/doctor_info_screen/binding/doctor_info_screen_binding.dart';
import 'package:servical/presentation/doctor_info_screen/doctor_info.dart';
import 'package:servical/presentation/doctor_login_screen/binding/doctor_login_screen_binding.dart';
import 'package:servical/presentation/doctor_login_screen/doctor_login_screen.dart';
import 'package:servical/presentation/doctor_not_verified_screen/binding/doctor_not_verified_screen_binding.dart';
import 'package:servical/presentation/doctor_not_verified_screen/doctor_not_verified_screen.dart';
import 'package:servical/presentation/doctor_signup_screen/doctor_signup_screen.dart';
import 'package:servical/presentation/doctor_verification_screen/binding/doctor_verification_screen_binding.dart';
import 'package:servical/presentation/doctor_verification_screen/doctor_verification_screen.dart';
import 'package:servical/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:servical/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:servical/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:servical/presentation/otp_screen/binding/otp_screen_binding.dart';
import 'package:servical/presentation/otp_screen/otp_screen.dart';
import 'package:servical/presentation/patient_info_screen/binding/patient_info_screen_binding.dart';
import 'package:servical/presentation/patient_info_screen/patient_info.dart';
import 'package:servical/presentation/patient_notes_screen/binding/patient_notes_screen_binding.dart';
import 'package:servical/presentation/patient_notes_screen/patients_notes_screen.dart';
import 'package:servical/presentation/profile_screen/binding/profile_screen_binding.dart';
import 'package:servical/presentation/profile_screen/profile_screen.dart';
import 'package:servical/presentation/reset_password_screen/binding/reset_password_screen_binding.dart';
import 'package:servical/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:servical/presentation/signup_screen/binding/signup_screen_binding.dart';
import 'package:servical/presentation/signup_screen/signup_screen.dart';
import 'package:servical/presentation/user_dashboard_screen/binding/user_dashboard_screen_binding.dart';
import 'package:servical/presentation/user_dashboard_screen/user_dashboard_screen.dart';
import 'package:servical/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:servical/presentation/verify_a_doc_screen/binding/verify_a_doc_screen_binding.dart';
import 'package:servical/presentation/verify_a_doc_screen/verify_a_doc_screen.dart';
import 'package:servical/presentation/write_patient_notes_screen/binding/write_patient_notes_screen_binding.dart';
import 'package:servical/presentation/write_patient_notes_screen/write_patients_notes_screen.dart';

import '../presentation/appointment_info_screen/binding/appointment_info_screen_binding.dart';
import '../presentation/doctor_dashboard_screen/binding/doctor_dashboard_screen_binding.dart';
import '../presentation/doctor_dashboard_screen/doctor_dashboard_screen.dart';
import '../presentation/forgot_password_screen/binding/forgot_password_screen_binding.dart';
import '../presentation/login_screen/binding/login_screen_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/user_profile_screen/binding/user_profile_screen_binding.dart';

class AppRoutes {
  //ONBOARDING

  static String onboardingRoute = '/onBoardingRoute';

  //AUTH & REGISTRATION

  static String initialRoute = '/initialRoute';

  static String loginRoute = '/loginRoute';

  static String forgotPasswordRoute = '/forgotPasswordRoute';

  static String signupRoute = '/signupRoute';

  static String otpScreenRoute = '/otpScreenRoute';

  static String resetPasswordRoute = '/resetPasswordRoute';

  //DOCTOR

  static String doctorloginRoute = '/doctorloginRoute';

  static String doctorSignupRoute = '/doctorSignupRoute';

  static String doctorVerificationRoute = '/doctorVerificationRoute';

  static String doctorNotVerifiedRoute = '/doctorNotVerifiedRoute';

  static String doctorInfoRoute = '/doctorInfoRoute';

  static String doctorDashboadRoute = '/doctorDashboardRoute';

  static String patientInfoRoute = '/patientInfoRoute';

  static String patientNotesRoute = '/patientNotesRoute';

  static String writepatientNotesRoute = '/writepatientNotesRoute';

  static String profileRoute = '/profileRoute';

  static String appointmentInfoRoute = '/appointmentInfoRoute';

  //USER
  static String userDashboadRoute = '/userDashboardRoute';

  static String userProfileRoute = '/userProfileRoute';

  //ABOUT
  static String aboutRoute = '/aboutRoute';

  //APPROVE A DOC
  static String approveDocRoute = '/approveDocRoute';

  static List<GetPage> pages = [
    GetPage(
      name: approveDocRoute,
      page: () => VerifyADocScreen(),
      bindings: [
        VerifyADocScreenBinding(),
      ],
    ),
    GetPage(
      name: appointmentInfoRoute,
      page: () => AppointmentInfo(),
      bindings: [
        ApointmentInfoBinding(),
      ],
    ),
    GetPage(
      name: userProfileRoute,
      page: () => UserProfile(),
      bindings: [
        UserProfileScreenBinding(),
      ],
    ),
    GetPage(
      name: aboutRoute,
      page: () => AboutScreen(),
      bindings: [
        AboutScreenBinding(),
      ],
    ),
    GetPage(
      name: profileRoute,
      page: () => ProfileScreen(),
      bindings: [
        ProfileScreenBinding(),
      ],
    ),
    GetPage(
      name: writepatientNotesRoute,
      page: () => WritePatientsNotes(),
      bindings: [
        WritePatientNotesBinding(),
      ],
    ),
    GetPage(
      name: patientNotesRoute,
      page: () => PatientsNotes(),
      bindings: [
        PatientNotesBinding(),
      ],
    ),
    GetPage(
      name: patientInfoRoute,
      page: () => PatientInfo(),
      bindings: [
        PatientInfoBinding(),
      ],
    ),
    GetPage(
      name: doctorDashboadRoute,
      page: () => DoctorDashboardScreen(),
      bindings: [
        DoctorDashboardScreenBinding(),
      ],
    ),
    GetPage(
      name: doctorNotVerifiedRoute,
      page: () => DoctorNotVerifiedScreen(),
      bindings: [
        DoctorNotVerifiedScreenBinding(),
      ],
    ),
    GetPage(
      name: doctorInfoRoute,
      page: () => DoctorInfo(),
      bindings: [
        DoctorInfoBinding(),
      ],
    ),
    GetPage(
      name: userDashboadRoute,
      page: () => UserDashboardScreen(),
      bindings: [
        UserDashboardScreenBinding(),
      ],
    ),
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
      name: resetPasswordRoute,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordScreenBinding(),
      ],
    ),
    GetPage(
      name: otpScreenRoute,
      page: () => OTPScreen(),
      bindings: [
        OTPScreenBinding(),
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
      name: onboardingRoute,
      page: () => OnboardingScreen(),
      bindings: [
        OnBoardingScreenBinding(),
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
