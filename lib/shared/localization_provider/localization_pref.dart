import 'package:shared_preferences/shared_preferences.dart';

class LocalizationPrefs {
  static const LangMode = "LANGMODE";

  setArabicLang(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LangMode, value);
  }

  Future<bool> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LangMode) ?? false;
  }
}
