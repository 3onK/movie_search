import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  @JsonKey(name: 'Source')
  String? source;
  @JsonKey(name: 'Value')
  String? value;

  Rating({this.source, this.value});

  @override
  String toString() => 'Rating(source: $source, value: $value)';

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Rating) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => source.hashCode ^ value.hashCode;
}
