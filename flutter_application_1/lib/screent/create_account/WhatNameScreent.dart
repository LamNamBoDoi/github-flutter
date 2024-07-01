import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_application_1/widget/TextFormFieldWidget.dart';

class WhatNameScreent extends StatelessWidget {
  const WhatNameScreent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Create account'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "What's your name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter the name you use in real life",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
            const SizedBox(
              height: 100,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                TextFormFieldWidget(labelText: 'First Name'),
                SizedBox(
                  width: 20,
                ),
                TextFormFieldWidget(labelText: 'Last Name'),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            const SizedBox(
              height: 130,
            ),
            ButtonWidget(text: 'Next', route: '/whatBirthday')
          ],
        ),
      ),
    );
  }
}
