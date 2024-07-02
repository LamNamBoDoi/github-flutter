import 'package:flutter/material.dart';

Widget container(
    {required String text,
    required Color color,
    double? height,
    double? width}) {
  return Container(
    height: height ?? 30,
    width: width ?? 90,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
    ),
  );
}
