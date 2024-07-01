import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class TermsPrivacyScreent extends StatefulWidget {
  const TermsPrivacyScreent({super.key});

  @override
  State<TermsPrivacyScreent> createState() => _MobileNumberScreentState();
}

class _MobileNumberScreentState extends State<TermsPrivacyScreent> {
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Terms & Privacy',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Finishing signing up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'By tapping Sign up, you agree to our',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Terms, Data Policy',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF384CFF)),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45),
              ),
              TextSpan(
                text: 'Cookies Policy',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF384CFF)),
              ),
            ])),
            SizedBox(
              height: 160,
            ),
            ButtonWidget(text: 'Next', route: '/home'),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Text(
                'Sign up without updating my contact',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF384CFF)),
              ),
            ),
            Text(
              'The Facebook company is now Meta. While our company name is changing, we are continuing to offer the same products, includingthe Facebook app from Meta. Our Data Policy and Terms of Service remain in effect, and this name change does not affect how we use or share data. Learn more about Meta and our vision for the metaverse.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
