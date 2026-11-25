
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/light_mode.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode =>
      _themeData.brightness == Brightness.dark;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = lightMode;
    } else {
      _themeData = darkMode;
    }

    notifyListeners();
  }
}
