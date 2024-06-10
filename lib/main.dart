import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/firebase_options.dart';
import 'package:parkinson_app/presentation/booked_appointment/booked_appoitnment_screen.dart';
import 'package:parkinson_app/presentation/bottom_app_bar/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/change_password/change_password_screen.dart';
import 'package:parkinson_app/presentation/doctors/doctors_screen.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password.dart';
import 'package:parkinson_app/presentation/home/home_screen.dart';
import 'package:parkinson_app/presentation/home/more_doctor_screen.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/profile/about_us/about_us_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_account_data_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_img_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/help/help_screen.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';
import 'package:parkinson_app/presentation/services/disease_information/disease_information.dart';
import 'package:parkinson_app/presentation/services/disease_result/diseae_result.dart';
import 'package:parkinson_app/presentation/services/services_screen.dart';
import 'package:parkinson_app/presentation/signup/signup_screen.dart';
import 'package:parkinson_app/presentation/theme_data.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';
import 'package:parkinson_app/presentation/booking/booking_screen.dart';
import 'package:parkinson_app/presentation/view_doctor/view_doctor_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        ViewDoctorScreen.screenName: (context) => const ViewDoctorScreen(),
        LoginScreen.screenName: (context) => const LoginScreen(),
        SignUpScreen.screenName: (context) => const SignUpScreen(),
        ForgotPassword.screenName: (context) => const ForgotPassword(),
        VerifyScreen.screenName: (context) => const VerifyScreen(),
        ChangePasswordScreen.screenName: (context) =>
            const ChangePasswordScreen(),
        AppBarAndBottomNav.screenName: (context) => const AppBarAndBottomNav(),
        HomeScreen.screenName: (context) => const HomeScreen(),
        ServicesScreen.screenName: (context) => const ServicesScreen(),
        DoctorsScreen.screenName: (context) => const DoctorsScreen(),
        ProfileScreen.screenName: (context) => const ProfileScreen(),
        MoreDoctorScreen.screenName: (context) => const MoreDoctorScreen(),
        DiseaseInformationScreen.screenName: (context) =>
            const DiseaseInformationScreen(),
        DiseaseResultScreen.screenName: (context) =>
            const DiseaseResultScreen(),
        EditAccount.screenName: (context) => const EditAccount(),
        PrivacyPolicyScreen.screenName: (context) =>
            const PrivacyPolicyScreen(),
        HelpScreen.screenName: (context) => const HelpScreen(),
        AboutUsScreen.screenName: (context) => const AboutUsScreen(),
        ChangePersonalPhoto.screenName: (context) =>
            const ChangePersonalPhoto(),
        ChangeAccountDataScreen.screenName: (context) =>
            const ChangeAccountDataScreen(),
        BookingScreen.screenName: (context) => const BookingScreen(),
        BookedAppoitnmentScreen.screenName: (context) =>
            const BookedAppoitnmentScreen(),
      },
      initialRoute: LoginScreen.screenName,
    );
  }
}
