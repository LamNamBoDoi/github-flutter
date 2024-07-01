import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_application_1/widget/TextFormFieldWidget.dart';

class ChoosePasswordScreent extends StatefulWidget {
  const ChoosePasswordScreent({super.key});

  @override
  State<ChoosePasswordScreent> createState() => _ChoosePasswordScreentState();
}

class _ChoosePasswordScreentState extends State<ChoosePasswordScreent> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Choose a password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Create a password at least with 6 characters',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Text(
              "It should be something others couldn't guess",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 90,
            ),
            TextFormFieldWidget(
              labelText: 'Password',
              controller: passwordController,
            ),
            const SizedBox(
              height: 70,
            ),
            ButtonWidget(text: 'Next', route: '/termsPrivacy'),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
