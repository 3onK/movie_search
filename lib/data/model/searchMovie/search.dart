import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Year')
  String? year;
  @JsonKey(name: 'imdbID')
  String? imdbId;
  @JsonKey(name: 'Type')
  String? type;
  @JsonKey(name: 'Poster')
  String? poster;

  Search({this.title, this.year, this.imdbId, this.type, this.poster});

  @override
  String toString() {
    return 'Search(title: $title, year: $year, imdbId: $imdbId, type: $type, poster: $poster)';
  }

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Search) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      year.hashCode ^
      imdbId.hashCode ^
      type.hashCode ^
      poster.hashCode;
}
