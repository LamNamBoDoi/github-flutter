import 'package:flutter/material.dart';

class MySettings extends ChangeNotifier {
  bool _isDark = false;

  get isDark => _isDark;

  void setBrightness(value) {
    _isDark = value;
    notifyListeners();
  }
}
