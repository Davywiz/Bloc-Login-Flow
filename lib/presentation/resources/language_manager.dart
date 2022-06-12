import 'package:flutter/material.dart';
import 'package:login_flow_bloc/presentation/resources/strings_manager.dart';

enum LanguageType {
  ENGLISH,
  SPANISH,
  FRENCH,
}

const String ENGLISH = "en";
const String SPANISH = "es";
const String FRENCH = "fr";
const String ASSETS_PATH_LOCALIZATION = "assets/translations";
const Locale SPANISH_LOCALE = Locale("es", "ES");
const Locale ENGLISH_LOCALE = Locale("en", "US");
const Locale FRENCH_LOCALE = Locale("fr", "FR");

extension LaguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.SPANISH:
        return SPANISH;
      case LanguageType.FRENCH:
        return FRENCH;
    }
  }

  String getTextString() {
    switch (this) {
      case LanguageType.ENGLISH:
        return AppStrings.english;
      case LanguageType.SPANISH:
        return AppStrings.spanish;
      case LanguageType.FRENCH:
        return AppStrings.french;
    }
  }
}
