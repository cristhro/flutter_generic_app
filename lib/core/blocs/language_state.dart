part of 'language_bloc.dart';

@immutable
class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState(this.locale) : assert(locale != null);

  Language get language {
    if (locale.languageCode == 'es') {
      return Language.ES;
    } else if (locale.languageCode == 'en') {
      return Language.EN;
    } else if (locale.languageCode == 'ca') {
      return Language.CA;
    }
    return Language.ES;
  }

  @override
  List<Object> get props => [locale];
}