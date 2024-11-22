import '../use_case.dart';

final class SearchQueryParam extends Params {
  const SearchQueryParam(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
