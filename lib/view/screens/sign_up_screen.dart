import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/view/widgets/form_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/controllers/auth_controller.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:firebase/view/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController _auth = AuthController();
  bool isSigningUp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    userNameController.dispose();
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
                    'assets/user.png',
                    width: 120,
                    height: 140,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: userNameController,
                  isPassword: false,
                  labelText: 'Name',
                ),
                const SizedBox(
                  height: 20,
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
                    _signUp();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 99, 89),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: isSigningUp
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Sign Up',
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
                      "Have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        ' Sign In',
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
        ));
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = userNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    try {
      User? user =
          await _auth.signUpWithEmailAndPassword(email, password, username);
      print(user);
      if (user != null) {
        showToast(message: "User is successfully created");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        showToast(message: "Some error happend");
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isSigningUp = false;
    });
  }
}
