import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required controller, required txtlabel})
      : _controller = controller,
        _txtLabel = txtlabel;

  final TextEditingController _controller;
  final String _txtLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(_txtLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return '$_txtLabel be empty';
      },
    );
  }
}
