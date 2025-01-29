import 'package:equatable/equatable.dart';

final class SearchQueryParams extends Equatable {
  const SearchQueryParams(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
