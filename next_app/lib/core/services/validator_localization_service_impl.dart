import 'package:domain/domain.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class ValidatorLocalizationServiceImpl
    implements ValidatorLocalizationService {
  const ValidatorLocalizationServiceImpl(this.localizations);

  final AppLocalizations localizations;

  @override
  String get fieldRequired => localizations.fieldRequired;

  @override
  String get invalidTitleLength => localizations.titleSymbolLengthInvalid;
}
