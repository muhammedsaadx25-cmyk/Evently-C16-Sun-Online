import 'package:evently_sun_online/core/resources/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode themeMode) {
    String currentTheme = themeMode == ThemeMode.light ? "Light" : "Dark";
    prefs.setString(CacheConstant.themeKey, currentTheme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(CacheConstant.themeKey);
    if (savedTheme == "Light") {
      return ThemeMode.light;
    }
    if (savedTheme == "Dark") {
      return ThemeMode.dark;
    }

    return null;
  }


  static void saveLanguage(String currentLanguage){
    prefs.setString(CacheConstant.languageKey, currentLanguage);
  }


  static String? getSavedLanguage(){
    return prefs.getString(CacheConstant.languageKey);
  }




}
