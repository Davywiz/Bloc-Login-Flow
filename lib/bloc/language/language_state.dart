// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale language;
  
  const LanguageState({
    required this.language,
    
  });

  const LanguageState.initial()
      : language = ENGLISH_LOCALE;
       
  @override
  List<Object?> get props => [language];
}
