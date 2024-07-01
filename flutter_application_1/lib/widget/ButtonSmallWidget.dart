import 'package:flutter/material.dart';

Widget button({height, width, color, colorText, required text}) {
  return Container(
    width: width ?? 110,
    height: height ?? 35,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: color,
        gradient: color == null
            ? const LinearGradient(
                colors: [Color(0xFF384CFF), Color(0xFF00A3FF)])
            : null),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: colorText ?? Colors.white,
        ),
      ),
    ),
  );
}
