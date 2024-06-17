import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
  // 카카오 이미지 검색 api
  Future<Response> getBySearch(keyword, page) async {
    const url = 'https://www.omdbapi.com';
    final query = {
      'apikey': '${dotenv.env['omdbApiKey']}',
      's': '$keyword',
      'page': '$page',
      'type': 'movie',
    };
    return await get(url, query: query);
  }

  Future<Response> getByID(imdbID) async {
    const url = 'https://www.omdbapi.com';
    final query = {
      'apikey': '${dotenv.env['omdbApiKey']}',
      'i': '$imdbID',
    };
    return await get(url, query: query);
  }
}
