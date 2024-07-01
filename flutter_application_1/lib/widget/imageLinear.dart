import 'package:flutter/material.dart';

Widget imageLinear(
    {required String image, required double height, required double width}) {
  return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
                colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      child: Image.asset(
        image,
        color: Colors.white,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ));
}
