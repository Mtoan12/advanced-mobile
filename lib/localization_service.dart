import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/lang/en_US.dart';
import 'package:lettutor/lang/vi_VN.dart';

class LocalizationService extends Translations {
  static final locale = Locale('vi', 'VN');
  static final fallBackLocale = Locale('vi', 'VN');

  static final langs = ['Vietnamese', 'English'];
  static final locales = [
    const Locale('vi', 'VN'),
    const Locale('en', 'US'),
  ];
  @override
  Map<String, Map<String, String>> get keys => {'vi_vn': viVN, 'en_us': enUS};

  void changeLocale(String lang) {
    final locale = getLocaleFormLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale getLocaleFormLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        return locales[i];
      }
    }
    return locale;
  }
}
