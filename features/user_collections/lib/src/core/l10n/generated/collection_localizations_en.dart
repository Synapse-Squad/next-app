import 'collection_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CollectionLocalizationsEn extends CollectionLocalizations {
  CollectionLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleSymbolLengthInvalid => 'at least 3 character required for title';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get youCantCreateSameCollection => 'You can\'t create same collection again!';
}
