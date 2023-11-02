import 'package:flutter/material.dart';
import 'package:munchmate/common/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppThemes.dark;

  void toggleTheme() {
    _themeData =
        _themeData == AppThemes.light ? AppThemes.dark : AppThemes.light;
    notifyListeners();
  }

  get themeData => _themeData;
}
