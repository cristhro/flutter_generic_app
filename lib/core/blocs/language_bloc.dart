import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_generic_app/di/injection_container.dart';
import 'package:flutter_generic_app/domain/services/i_shared_preferences_service.dart';
import 'package:flutter_generic_app/localizations/enums.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('es', 'ES')));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is LanguageLoadStarted) {
      yield* _mapLanguageLoadStartedToState();
    } else if (event is LanguageSelected) {
      yield* _mapLanguageSelectedToState(event.languageCode);
    }
  }

  Stream<LanguageState> _mapLanguageLoadStartedToState() async* {
    final sharedPrefService = getIt<SharedPreferences>();

    final defaultLanguageCode = sharedPrefService.getString(SharedPrefKeys.languageCode);
    Locale locale;

    if (defaultLanguageCode == null) {
      locale = Locale('en', 'US');
      await sharedPrefService.setString(SharedPrefKeys.languageCode, locale.languageCode);
    } else {
      locale = Locale(defaultLanguageCode);
    }

    yield LanguageState(locale);
  }

  Stream<LanguageState> _mapLanguageSelectedToState(Language selectedLanguage) async* {
    final sharedPrefService = getIt<SharedPreferences>();
    final defaultLanguageCode = sharedPrefService.getString(SharedPrefKeys.languageCode);

    if (selectedLanguage == Language.ES && defaultLanguageCode != 'es') {
      yield* _loadLanguage('es', 'ES');
    } else if (selectedLanguage == Language.EN && defaultLanguageCode != 'en') {
      yield* _loadLanguage('en', 'US');
    } else if (selectedLanguage == Language.CA && defaultLanguageCode != 'ca') {
      yield* _loadLanguage('ca', 'ES');
    }
  }

  /// This method is added to reduce code repetition.
  Stream<LanguageState> _loadLanguage(String languageCode, String countryCode) async* {
    final sharedPrefService = getIt<SharedPreferences>();

    final locale = Locale(languageCode, countryCode);
    await sharedPrefService.setString(SharedPrefKeys.languageCode, locale.languageCode);
    yield LanguageState(locale);
  }
}
