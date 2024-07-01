import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';

class ForgotPasswordEmailScreent extends StatefulWidget {
  const ForgotPasswordEmailScreent({super.key});

  @override
  State<ForgotPasswordEmailScreent> createState() =>
      _ForgotPasswordEmailScreentState();
}

class _ForgotPasswordEmailScreentState
    extends State<ForgotPasswordEmailScreent> {
  final _emailController = TextEditingController();
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
              const Text(
                'Enter your email number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/otp',
                    arguments: _emailController.text),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 11),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF384CFF), Color(0xFF00A3FF)])),
                  child: const Center(
                    child: Text(
                      'Find Your Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'Search by number insted',
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
