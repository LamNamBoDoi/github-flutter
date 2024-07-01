import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/ButtonOutlineWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_application_1/widget/LogoFaceWidget.dart';
import 'dart:math' as math;

class LoginScreent extends StatefulWidget {
  const LoginScreent({super.key});

  @override
  State<LoginScreent> createState() => _LoginScreentState();
}

class _LoginScreentState extends State<LoginScreent> {
  final phoneController = TextEditingController();
  final passwordphoneController = TextEditingController();
  bool _obsureText = true;
  FocusNode _focusPhone = FocusNode();
  FocusNode _focusPassword = FocusNode();
  bool _isFocusPhone = false;
  bool _isFocusPassword = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusPhone.addListener(() {
      setState(() {
        _isFocusPhone = _focusPhone.hasFocus;
      });
    });

    _focusPassword.addListener(() {
      setState(() {
        _isFocusPassword = _focusPassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusPassword.dispose();
    _focusPhone.dispose();
    phoneController.dispose();
    passwordphoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          height: 70,
          color: Color(0xFF2669FF).withOpacity(0.7),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            color: const Color(0xFF2669FF),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 70),
          color: const Color(0xFF2669FF),
        ),
        Container(
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
            color: Color(0xFF2669FF).withOpacity(0.7),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180)),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180)),
            color: Color(0xFF2669FF).withOpacity(0.4),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180)),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180)),
            color: Color(0xFF2768FF).withOpacity(0.2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 190),
          padding: EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                if (!_isFocusPhone && !_isFocusPassword)
                  LogoFaceWidget(width: 50, height: 80)
                else
                  SizedBox.shrink(),
                SizedBox(
                  height: 10,
                ),
                if (!_isFocusPhone && !_isFocusPassword)
                  SizedBox(
                    height: 10,
                  )
                else
                  SizedBox.shrink(),
                TextFormField(
                  focusNode: _focusPhone,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: 'Phone or Email',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                TextFormField(
                  focusNode: _focusPassword,
                  controller: passwordphoneController,
                  obscureText: _obsureText,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () => setState(() {
                              _obsureText = !_obsureText;
                            }),
                        child: _obsureText
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              )),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                if (!_isFocusPhone && !_isFocusPassword)
                  SizedBox(
                    height: 20,
                  )
                else
                  SizedBox.shrink(),
                SizedBox(
                  height: 15,
                ),
                ButtonWidget(text: 'Login', route: ''),
                if (!_isFocusPhone && !_isFocusPassword)
                  SizedBox(
                    height: 10,
                  )
                else
                  SizedBox.shrink(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgotPasswordMobile');
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF384CFF)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (!_isFocusPhone && !_isFocusPassword)
                  SizedBox(
                    height: 20,
                  )
                else
                  SizedBox.shrink(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 115,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text(
                      'OR',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 115,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                if (!_isFocusPhone && !_isFocusPassword)
                  SizedBox(
                    height: 20,
                  )
                else
                  SizedBox.shrink(),
                ButtonOutlineWidget(
                  strokeWidth: 2,
                  radius: 15,
                  gradient: const LinearGradient(
                      colors: [Color(0xFF384CFF), Color(0xFF00A3FF)]),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Create new Facebook account',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/joinFacebook'),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 190, left: 5),
          height: 55,
          width: 55,
          child: Transform.rotate(
              angle: -10 * math.pi / 180,
              child: Image.asset(
                'assets/messenger.png',
                color: Colors.white,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 130, left: 120),
          height: 55,
          width: 55,
          child: Transform.rotate(
              angle: -10 * math.pi / 180,
              child: Image.asset(
                'assets/magnifying-glass.png',
                color: Colors.white,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 70, left: 30),
          height: 55,
          width: 55,
          child: Transform.rotate(
              angle: -20 * math.pi / 180,
              child: Image.asset(
                'assets/like.png',
                color: Colors.white,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 44, left: 160),
          height: 55,
          width: 55,
          child: Transform.rotate(
              angle: 10 * math.pi / 180,
              child: Image.asset(
                'assets/newspaper.png',
                color: Colors.white,
              )),
        )
      ]),
    );
  }
}
