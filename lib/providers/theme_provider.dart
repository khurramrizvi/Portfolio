import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = Themes.lightTheme;
  bool toggle = true;

  //getter to obtain current theme
  get getTheme => _currentTheme;

  //method to toggle between light and dark theme
  void toggleTheme() {
    toggle = !toggle;
    updateTheme();
  }

  void updateTheme() {
    if (toggle) {
      _currentTheme = Themes.lightTheme;
      notifyListeners();
    } else {
      _currentTheme = Themes.darkTheme;
      notifyListeners();
    }
  }
}
