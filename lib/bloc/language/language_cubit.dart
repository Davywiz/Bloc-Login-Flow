import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_flow_bloc/app/app_prefs.dart';
import 'package:login_flow_bloc/presentation/resources/language_manager.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  late final AppPreferences _appPreferences;
  LanguageCubit(this._appPreferences) : super(const LanguageState.initial());

  Future<void> setLanguageChanged(LanguageType lang) async {
    String currentLanguage = await _appPreferences.getAppLAnguage();
    if (currentLanguage == lang.getValue()) {
      //return if user is choosing existing language
      return;
    } else {
      //save prefs with set language and emit new locale
      _appPreferences.setLanguageChanged(lang);
      switch (lang) {
        case LanguageType.ENGLISH:
          emit(const LanguageState(language: ENGLISH_LOCALE, setLocale: true));
          return;
        case LanguageType.SPANISH:
          emit(const LanguageState(language: SPANISH_LOCALE, setLocale: true));
          return;
        case LanguageType.FRENCH:
          emit(const LanguageState(language: FRENCH_LOCALE, setLocale: true));
          return;
      }
    }
  }

  Future<void> getLocal() async {
    String currentLanguage = await _appPreferences.getAppLAnguage();

    if (currentLanguage == LanguageType.SPANISH.getValue()) {
      emit(const LanguageState(language: SPANISH_LOCALE, setLocale: false));
    } else if (currentLanguage == LanguageType.FRENCH.getValue()) {
      emit(const LanguageState(language: FRENCH_LOCALE, setLocale: false));
    } else {
      emit(const LanguageState(language: ENGLISH_LOCALE, setLocale: false));
    }
  }
}
