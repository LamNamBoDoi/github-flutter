import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class ForgotPasswordMobileScreent extends StatefulWidget {
  const ForgotPasswordMobileScreent({super.key});

  @override
  State<ForgotPasswordMobileScreent> createState() =>
      _ForgotPasswordScreentState();
}

class _ForgotPasswordScreentState extends State<ForgotPasswordMobileScreent> {
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Find Your Account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Enter your phone number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(hintText: 'Phone number'),
              ),
              SizedBox(
                height: 80,
              ),
              ButtonWidget(
                  text: 'Find Your Account', route: '/forgotPasswordEmail'),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPasswordEmail');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        'Search by email insted',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF384CFF)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
