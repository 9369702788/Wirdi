import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeService extends ChangeNotifier {
  ThemeService._();
  static final ThemeService instance = ThemeService._();
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
  Future<void> loadTheme() async { final p = await SharedPreferences.getInstance(); _isDark = p.getBool('dark_mode') ?? false; notifyListeners(); }
  Future<void> toggleTheme(bool value) async { _isDark = value; final p = await SharedPreferences.getInstance(); await p.setBool('dark_mode', value); notifyListeners(); }
}
