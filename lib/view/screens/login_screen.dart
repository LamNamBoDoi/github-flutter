import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/controllers/auth_controller.dart';
import 'package:firebase/view/screens/home_screen.dart';
import 'package:firebase/view/screens/sign_up_screen.dart';
import 'package:firebase/view/widgets/form_container_widget.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSigning = false;
  final AuthController _auth = AuthController();
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authcolor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/bubble-tea.png',
                  width: 120,
                  height: 140,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FormContainerWidget(
                controller: emailController,
                isPassword: false,
                labelText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              FormContainerWidget(
                controller: passwordController,
                isPassword: true,
                labelText: 'Password',
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  _login();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: button_color,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: _isSigning
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                          color: Color.fromARGB(255, 232, 99, 89),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isSigning = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: 'User is successfully signed in');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      showToast(message: 'Some error occured');
    }
  }
}
