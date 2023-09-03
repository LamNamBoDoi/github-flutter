import 'package:flutter/material.dart';
import 'package:hello_world/page/welcome.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(AnimatedLogin());

class AnimatedLogin extends StatelessWidget {
  const AnimatedLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(fontFamily: 'Satoshi'),
        home: WelcomePage(),
      ),
    );
  }
}
