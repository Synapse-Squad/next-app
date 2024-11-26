import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

import '../core/use_case/use_case.dart';

base class ValidateCreateCollectionUseCase
    extends UseCase<CreateCollectionValidatorResult?, CreateCollectionParams> {
  const ValidateCreateCollectionUseCase({
    required this.validateTitleUseCase,
    required this.typeRequiredUSeCas,
  });

  final ValidateTitleUseCase validateTitleUseCase;
  final ValidateRequiredUseCase<CollectionTypes> typeRequiredUSeCas;

  @override
  CreateCollectionValidatorResult? execute(CreateCollectionParams param) {
    final titleValidator = validateTitleUseCase.execute(param.title);
    final typeValidator = typeRequiredUSeCas.execute(param.type);

    if (titleValidator == null && typeValidator == null) {
      return null;
    }

    return CreateCollectionValidatorResult(
      titleValidationMessage: titleValidator,
      typeValidationMessage: typeValidator,
    );
  }
}

class CreateCollectionValidatorResult extends Equatable {
  const CreateCollectionValidatorResult({
    this.titleValidationMessage,
    this.typeValidationMessage,
  });

  final String? titleValidationMessage;
  final String? typeValidationMessage;

  @override
  List<Object?> get props => [
        titleValidationMessage,
        typeValidationMessage,
      ];
}
