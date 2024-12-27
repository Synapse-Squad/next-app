import 'collection_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class CollectionLocalizationsAz extends CollectionLocalizations {
  CollectionLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get titleSymbolLengthInvalid => 'başlıq üçün ən azı 3 simvol olmalıdır';

  @override
  String get fieldRequired => 'bu sahə tələb olunandır!';

  @override
  String get youCantCreateSameCollection => 'Eyni listi yenidən yarada bilməzsən!';
}
