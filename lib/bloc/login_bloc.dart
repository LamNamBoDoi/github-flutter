import 'dart:async';

import 'package:hello_world/bloc/login_event.dart';
import 'package:hello_world/bloc/login_state.dart';

class LoginBloc {
  final _stateController = StreamController<LoginState>();
  Stream<LoginState> get state => _stateController.stream;

  void send(LoginEvent event) {
    switch (event) {
      case LoginEvent.login:
        _stateController.sink.add(LoginState.loading());
        Future.delayed(Duration(seconds: 2), () {
          _stateController.sink.add(LoginState.success());
        });
    }
  }

  void dispose() {
    _stateController.close();
  }
}
