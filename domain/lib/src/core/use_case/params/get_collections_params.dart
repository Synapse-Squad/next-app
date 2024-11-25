import '../../enums/collection_types.dart';
import '../../enums/order_options.dart';
import '../use_case.dart';

final class GetCollectionsParams extends Params {
  const GetCollectionsParams({
    this.type,
    this.orderOptions,
  });

  final CollectionTypes? type;
  final OrderOptions? orderOptions;

  @override
  List<Object?> get props => [type, orderOptions];
}
