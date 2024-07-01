import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_application_1/widget/TextFormFieldWidget.dart';

class MobileNumberScreent extends StatefulWidget {
  const MobileNumberScreent({super.key});

  @override
  State<MobileNumberScreent> createState() => _MobileNumberScreentState();
}

class _MobileNumberScreentState extends State<MobileNumberScreent> {
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Mobile number',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Enter your mobile number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter the mobile number where you can be reached',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Text(
              'No one else will see this on your profile',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 90,
            ),
            TextFormFieldWidget(
              labelText: 'Mobile number',
              controller: mobileController,
            ),
            SizedBox(
              height: 70,
            ),
            ButtonWidget(text: 'Next', route: '/choosePassword'),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
