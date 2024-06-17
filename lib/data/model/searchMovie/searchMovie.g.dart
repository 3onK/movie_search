// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchMovie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovie _$SearchMovieFromJson(Map<String, dynamic> json) => SearchMovie(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as String?,
      response: json['Response'] as String?,
    );

Map<String, dynamic> _$SearchMovieToJson(SearchMovie instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'totalResults': instance.totalResults,
      'Response': instance.response,
    };
