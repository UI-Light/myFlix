import 'dart:io';
import 'package:dio/dio.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/models/result_model.dart';
import 'package:myflix/core/utils/logger.dart';

class SearchRepository {
  late final _logger = getLogger(SearchRepository);

  late final Dio _client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      baseUrl: const String.fromEnvironment('TMDB_SEARCH_URL'),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${const String.fromEnvironment('TMDB_READ_ACCESS_TOKEN')}',
      },
    ),
  );

  Future<List<Movie>> searchMovie(String keyword) async {
    final response = await _client
        .get('movie?query=$keyword&include_adult=false&language=en-US&page=1');
    _logger.log("this is response statuscode: ${response.statusCode}");
    _logger.log("this is response: $response");

    if (response.statusCode == 200) {
      List<Movie> searchResults = Result.fromJson(response.data).movieResults;
      return searchResults;
    } else {
      throw Exception('Query not found');
    }
  }
}
