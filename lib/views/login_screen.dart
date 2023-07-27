import 'package:flutter/material.dart';
import 'package:hello_world/bloc/login_event.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: loginBloc.state,
        builder: ((context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (snapshot.data!.isLoading)
                  const CircularProgressIndicator()
                else if (snapshot.data!.isFailure)
                  Text('Login that bai')
                else
                  Text('Login thanh cong'),
                ElevatedButton(
                    onPressed: () {
                      loginBloc.send(LoginEvent.login);
                    },
                    child: (Text('Send')))
              ],
            ),
          );
        }),
        initialData: LoginState.initial(),
      ),
    );
  }
}
