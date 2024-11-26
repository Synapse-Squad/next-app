import 'package:domain/domain.dart';

final class ValidatorLocalizationServiceImpl
    implements ValidatorLocalizationService {
  @override
  String get fieldRequired => 'Field is required!';

  @override
  String get invalidTitleLength =>
      'Title length should be greater than 3 symbols!';
}
