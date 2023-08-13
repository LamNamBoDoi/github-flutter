import 'package:flutter/material.dart';
import 'package:hello_world/screen/add_employee_sreen.dart';
import 'package:hello_world/screen/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generteRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => AddEmployee());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('No Route'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Sorry no route was found!',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    });
  }
}
