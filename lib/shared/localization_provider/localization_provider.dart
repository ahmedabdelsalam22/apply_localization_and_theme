import 'package:flutter/material.dart';

import 'localization_pref.dart';

class LocalizationProvider with ChangeNotifier {
  LocalizationPrefs localizationPrefs = LocalizationPrefs();

  bool _arabicLang = false;
  bool get getArabicLang => _arabicLang;

  set setArabicLang(bool value) {
    _arabicLang = value;
    localizationPrefs.setArabicLang(value);
    notifyListeners();
  }
}
