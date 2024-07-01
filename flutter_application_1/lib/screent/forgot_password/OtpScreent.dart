import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class OtpScreents extends StatefulWidget {
  const OtpScreents({super.key});

  @override
  State<OtpScreents> createState() => _OtpScreentsState();
}

class _OtpScreentsState extends State<OtpScreents> {
  final _textController = TextEditingController();

  String _addSpaces(String text) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      result += text[i];
      if (i < text.length - 1) {
        result += '    ';
      }
    }
    return result;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;

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
                'Enter the code we sent to ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We sent 6 digit code to your email address.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _textController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                  hintText: 'Enter Code',
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.center,
                onChanged: (text) {
                  String newText = text.replaceAll(' ', '');
                  if (newText.length > 6) {
                    newText = newText.substring(0, 6);
                  }
                  _textController.value = _textController.value.copyWith(
                    text: _addSpaces(newText),
                    selection: TextSelection.collapsed(
                        offset: _addSpaces(newText).length),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(text: 'Continue', route: '/createNewPassword'),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Send email again',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.sms_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Get code via SMS',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
