import 'package:base_getx_2025/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {

  var locale = const Locale('en', 'US').obs;
  var themeMode = ThemeMode.system.obs;
@override
  void onInit() {
  loadFromStorage();
  super.onInit();
  }

  Future<void> loadFromStorage() async {
    final getStg = GetStorage();
    themeMode.value = _stringToThemeMode(getStg.read(LocalPrefsKey.THEME_MODE) ?? 'system');
    locale.value = _stringToLocale(getStg.read(LocalPrefsKey.LANGUAGE) ?? 'en');
  }

  Future<void> updateTheme(ThemeMode mode) async {
    final getStg = GetStorage();
    await getStg.write(LocalPrefsKey.THEME_MODE, _themeModeToString(mode));
    themeMode.value = mode;
  }

  Future<void> updateLanguage(Locale lcl) async {
    final getStg = GetStorage();
    await getStg.write(LocalPrefsKey.LANGUAGE, lcl.languageCode);
    locale.value = lcl;
  }
static Locale _stringToLocale(String value) {
    switch (value) {
      case 'en':
        return const Locale('en');
      case 'vi':
        return const Locale('vi');
      default:
        return const Locale('en');
    }
  }
  static ThemeMode _stringToThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
      default:
        return 'system';
    }
  }
}