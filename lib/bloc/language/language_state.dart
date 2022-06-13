// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale language;
  final bool setLocale;

  const LanguageState({
    required this.language,
    required this.setLocale,
  });

  const LanguageState.initial()
      : language = ENGLISH_LOCALE,
        setLocale = false;

  @override
  List<Object?> get props => [language, setLocale];
}
