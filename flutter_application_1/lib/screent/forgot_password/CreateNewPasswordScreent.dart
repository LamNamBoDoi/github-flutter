import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class CreateNewPasswordScreent extends StatelessWidget {
  CreateNewPasswordScreent({super.key});
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Reset your password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              const Text(
                'Create new password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                'You will use this password to access your account. Enter a combination of at least six numbers, letters and punctuation marks.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(hintText: 'Password'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              ButtonWidget(text: 'Log in', route: ''),
            ],
          ),
        ),
      ),
    );
  }
}
