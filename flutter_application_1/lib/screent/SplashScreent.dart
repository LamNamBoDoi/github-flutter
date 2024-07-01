import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/logofacewidget.dart';

class SplashScreent extends StatefulWidget {
  const SplashScreent({super.key});

  @override
  State<SplashScreent> createState() => _SplashScreentState();
}

class _SplashScreentState extends State<SplashScreent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/profilLogin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Container(
            child: Column(
              children: [
                Container(
                    child: Center(
                        child: LogoFaceWidget(
                  width: 100,
                  height: 130,
                ))),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'facebook',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Colors.white, // fallback color
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Opacity(
                    opacity: 0.5,
                    child: Text('From',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/meta.png",
                      width: 25,
                      height: 20,
                    ),
                    Text(
                      'Meta',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
