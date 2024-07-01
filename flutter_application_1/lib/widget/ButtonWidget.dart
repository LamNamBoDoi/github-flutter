import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.text, required this.route});
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        margin: const EdgeInsets.only(bottom: 11),
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xFF384CFF), Color(0xFF00A3FF)])),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
