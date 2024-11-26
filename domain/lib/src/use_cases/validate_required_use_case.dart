import '../core/use_case/use_case.dart';
import '../services/validator_localization_service.dart';

base class ValidateRequiredUseCase<T> extends UseCase<String?, T?> {
  const ValidateRequiredUseCase(this.localizationService);

  final ValidatorLocalizationService localizationService;

  @override
  String? execute(T? param) {
    if (param == null) {
      return localizationService.fieldRequired;
    }

    return null;
  }
}
