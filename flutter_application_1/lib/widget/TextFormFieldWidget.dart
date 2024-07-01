import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({required this.labelText, this.controller});
  final String labelText;
  final TextEditingController? controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _showClearButton = false;
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: widget.labelText,
            suffixIcon: _showClearButton
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _showClearButton = false;
                      });
                    },
                    icon: Container(
                        height: 8,
                        width: 8,
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        )))
                : null),
        controller: widget.controller,
      ),
    );
  }
}
