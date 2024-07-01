import 'package:flutter/material.dart';
import 'package:flutter_application_1/screent/create_account/ChoosePasswordScreent.dart';
import 'package:flutter_application_1/screent/forgot_password/CreateNewPasswordScreent.dart';
import 'package:flutter_application_1/screent/forgot_password/ForgotPasswordEmail.dart';
import 'package:flutter_application_1/screent/forgot_password/ForgotPasswordMobileScreent.dart';
import 'package:flutter_application_1/screent/HomeScreent.dart';
import 'package:flutter_application_1/screent/create_account/JoinFacebookScreent.dart';
import 'package:flutter_application_1/screent/LoginScreent.dart';
import 'package:flutter_application_1/screent/messanger/MessangerChatScreent.dart';
import 'package:flutter_application_1/screent/messanger/MessangerIntroScreent.dart';
import 'package:flutter_application_1/screent/messanger/MessangerScreent.dart';
import 'package:flutter_application_1/screent/create_account/MobileNumberScreent.dart';
import 'package:flutter_application_1/screent/forgot_password/OtpScreent.dart';
import 'package:flutter_application_1/screent/SplashScreent.dart';
import 'package:flutter_application_1/screent/create_account/TermsPrivacyScreent.dart';
import 'package:flutter_application_1/screent/create_account/WhatBirthdayScreent.dart';
import 'package:flutter_application_1/screent/create_account/WhatGenderScreent.dart';
import 'package:flutter_application_1/screent/create_account/WhatNameScreent.dart';
import 'package:flutter_application_1/screent/messanger/NewMessangerScreent.dart';
import 'package:flutter_application_1/screent/profilloginscreent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreent(),
        '/profilLogin': (context) => ProfilLoginScreent(),
        '/joinFacebook': (context) => JoinFacebookScreent(),
        '/whatName': (context) => WhatNameScreent(),
        '/whatBirthday': (context) => WhatBirthdayScreent(),
        '/whatGender': (context) => WhatGenderScreent(),
        '/mobileNumber': (context) => MobileNumberScreent(),
        '/choosePassword': (context) => ChoosePasswordScreent(),
        '/termsPrivacy': (context) => TermsPrivacyScreent(),
        '/login': (context) => LoginScreent(),
        '/forgotPasswordMobile': (context) => ForgotPasswordMobileScreent(),
        '/forgotPasswordEmail': (context) => ForgotPasswordEmailScreent(),
        '/otp': (context) => OtpScreents(),
        '/createNewPassword': (context) => CreateNewPasswordScreent(),
        '/home': (context) => HomeScreent(),
        '/messanger': (context) => MessangerScreent(),
        '/newMessanger': (context) => NewMessangerScreent(),
        '/introMessanger': (context) => MessangerIntroScreent(),
        '/messangerChat': (context) => MessangerChatScreent(),
      },
    );
  }
}
