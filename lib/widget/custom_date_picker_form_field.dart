import 'package:flutter/material.dart';

class CustomDatePickerFormFiled extends StatelessWidget {
  final TextEditingController _controller;
  final String _txtLabel;
  final VoidCallback _callBack;

  const CustomDatePickerFormFiled(
      {super.key,
      required TextEditingController controller,
      required String txtLabel,
      required VoidCallback callBack})
      : _controller = controller,
        _txtLabel = txtLabel,
        _callBack = callBack;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(_txtLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return '$_txtLabel cannot be empty';
      },
      onTap: _callBack,
    );
  }
}
