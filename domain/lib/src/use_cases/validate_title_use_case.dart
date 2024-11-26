import 'package:domain/src/core/use_case/use_case.dart';

import '../services/validator_localization_service.dart';

base class ValidateTitleUseCase extends UseCase<String?, String?> {
  const ValidateTitleUseCase(this.localizationService);

  final ValidatorLocalizationService localizationService;

  @override
  String? execute(String? param) {
    final trimmedTitle = param?.trim();

    if (trimmedTitle == null || trimmedTitle.length < 3) {
      return localizationService.invalidTitleLength;
    }

    return null;
  }
}
