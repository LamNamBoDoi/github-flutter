import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class JoinFacebookScreent extends StatelessWidget {
  const JoinFacebookScreent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Create account'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image.asset(
                'assets/illustration1.jpg',
                width: MediaQuery.of(context).size.width,
                height: 218,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Join Facebook',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "We'll help you",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45),
                  ),
                  const Text(
                    "create a new account in a few easy steps",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  ButtonWidget(text: 'Next', route: '/whatName')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text('Already have an account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF384CFF))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
