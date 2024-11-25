import '../use_case.dart';

final class SearchQueryParams extends Params {
  const SearchQueryParams(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
