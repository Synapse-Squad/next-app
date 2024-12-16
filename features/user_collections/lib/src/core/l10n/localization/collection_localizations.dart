import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

import 'collection_localizations_az.dart';
import 'collection_localizations_en.dart';

abstract class CollectionLocalizations {
  CollectionLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CollectionLocalizations of(BuildContext context) {
    return Localizations.of<CollectionLocalizations>(
      context,
      CollectionLocalizations,
    )!;
  }

  static const LocalizationsDelegate<CollectionLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[delegate];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en')
  ];

  /// No description provided for @titleSymbolLengthInvalid.
  ///
  /// In en, this message translates to:
  /// **'at least 3 character required for title'**
  String get titleSymbolLengthInvalid;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @youCantCreateSameCollection.
  ///
  /// In en, this message translates to:
  /// **'You can\'t create same collection again!'**
  String get youCantCreateSameCollection;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<CollectionLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<CollectionLocalizations> load(Locale locale) {
    return SynchronousFuture<CollectionLocalizations>(
        lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['az', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

CollectionLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
