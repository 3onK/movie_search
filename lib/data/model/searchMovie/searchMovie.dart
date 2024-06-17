import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'search.dart';

part 'searchMovie.g.dart';

@JsonSerializable()
class SearchMovie {
  @JsonKey(name: 'Search')
  List<Search>? search;
  String? totalResults;
  @JsonKey(name: 'Response')
  String? response;

  SearchMovie({this.search, this.totalResults, this.response});

  @override
  String toString() {
    return 'SearchMovie(search: $search, totalResults: $totalResults, response: $response)';
  }

  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    return _$SearchMovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SearchMovie) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      search.hashCode ^ totalResults.hashCode ^ response.hashCode;
}
