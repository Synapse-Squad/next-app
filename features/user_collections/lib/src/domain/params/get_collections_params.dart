import 'package:equatable/equatable.dart';
import 'package:next_database_service/next_database_service.dart';

final class GetCollectionsParams extends Equatable {
  const GetCollectionsParams({
    this.type,
    this.orderOptions,
  });

  final CollectionTypes? type;
  final OrderOptions? orderOptions;

  @override
  List<Object?> get props => [type, orderOptions];
}
