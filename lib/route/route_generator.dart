import 'package:flutter/material.dart';
import '../screen/add_employee.dart';
import '../screen/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/addEmployee':
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
            'Srroy no route was found!',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    });
  }
}
