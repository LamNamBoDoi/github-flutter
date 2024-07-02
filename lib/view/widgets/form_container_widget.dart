import 'package:firebase/consts/global_constrants.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  const FormContainerWidget(
      {super.key,
      required this.controller,
      required this.isPassword,
      required this.labelText,
      this.icon});

  final TextEditingController? controller;
  final bool? isPassword;
  final Icon? icon;
  final String? labelText;

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: authcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: widget.controller,
        cursorColor: Colors.black,
        obscureText: widget.isPassword == true ? _obscureText : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white24,
            labelStyle: const TextStyle(color: Colors.black),
            labelText: widget.labelText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: widget.isPassword == true
                  ? Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    )
                  : Text(""),
            )),
      ),
    );
  }
}
