import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'rating.dart';

part 'movieDetail.g.dart';

@JsonSerializable()
class MovieDetail {
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Year')
  String? year;
  @JsonKey(name: 'Rated')
  String? rated;
  @JsonKey(name: 'Released')
  String? released;
  @JsonKey(name: 'Runtime')
  String? runtime;
  @JsonKey(name: 'Genre')
  String? genre;
  @JsonKey(name: 'Director')
  String? director;
  @JsonKey(name: 'Writer')
  String? writer;
  @JsonKey(name: 'Actors')
  String? actors;
  @JsonKey(name: 'Plot')
  String? plot;
  @JsonKey(name: 'Language')
  String? language;
  @JsonKey(name: 'Country')
  String? country;
  @JsonKey(name: 'Awards')
  String? awards;
  @JsonKey(name: 'Poster')
  String? poster;
  @JsonKey(name: 'Ratings')
  List<Rating>? ratings;
  @JsonKey(name: 'Metascore')
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  @JsonKey(name: 'imdbID')
  String? imdbId;
  @JsonKey(name: 'Type')
  String? type;
  @JsonKey(name: 'DVD')
  String? dvd;
  @JsonKey(name: 'BoxOffice')
  String? boxOffice;
  @JsonKey(name: 'Production')
  String? production;
  @JsonKey(name: 'Website')
  String? website;
  @JsonKey(name: 'Response')
  String? response;

  MovieDetail({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  @override
  String toString() {
    return 'MovieDetail(title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, ratings: $ratings, metascore: $metascore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, dvd: $dvd, boxOffice: $boxOffice, production: $production, website: $website, response: $response)';
  }

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MovieDetail) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      year.hashCode ^
      rated.hashCode ^
      released.hashCode ^
      runtime.hashCode ^
      genre.hashCode ^
      director.hashCode ^
      writer.hashCode ^
      actors.hashCode ^
      plot.hashCode ^
      language.hashCode ^
      country.hashCode ^
      awards.hashCode ^
      poster.hashCode ^
      ratings.hashCode ^
      metascore.hashCode ^
      imdbRating.hashCode ^
      imdbVotes.hashCode ^
      imdbId.hashCode ^
      type.hashCode ^
      dvd.hashCode ^
      boxOffice.hashCode ^
      production.hashCode ^
      website.hashCode ^
      response.hashCode;
}
