import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movieSearch/data/model/movie_detail/movieDetail.dart';
import 'package:movieSearch/data/model/searchMovie/searchMovie.dart';
import 'package:movieSearch/data/provider/api.dart';
import 'package:movieSearch/style/color.dart';

abstract class AbstractRepository {
  Future<SearchMovie> getBySearch(keyword, page);
  Future<MovieDetail> getByID(imdbID);
}

class Repository extends GetxService implements AbstractRepository {
  final Api api;

  Repository({required this.api});

  @override
  Future<SearchMovie> getBySearch(keyword, page) async {
    try {
      Response res = await api.getBySearch(keyword, page);
      if (res.body['Response'] == 'False') {
        Fluttertoast.showToast(msg: res.body['Error'], textColor: primaryWhite);
      }

      return SearchMovie.fromJson(res.body);
    } catch (e) {
      log("error: $e");
      rethrow;
    }
  }

  @override
  Future<MovieDetail> getByID(imdbID) async {
    try {
      Response res = await api.getByID(imdbID);
      if (res.body['Response'] == 'False') {
        Fluttertoast.showToast(msg: res.body['Error'], textColor: primaryWhite);
      }

      return MovieDetail.fromJson(res.body);
    } catch (e) {
      log("error: $e");
      rethrow;
    }
  }
}
