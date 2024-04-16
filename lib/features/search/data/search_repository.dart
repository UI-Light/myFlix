import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/models/result_model.dart';
import 'package:myflix/core/utils/logger.dart';

class SearchRepository {
  final ApiClient _client;

  SearchRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  late final _logger = getLogger(SearchRepository);

  Future<List<Movie>> searchMovie(String keyword) async {
    final response = await _client.dio.get(
        'search/movie?query=$keyword&include_adult=false&language=en-US&page=1');
    _logger.log("this is response statuscode: ${response.statusCode}");
    _logger.log("this is response: $response");

    if (response.statusCode == 200) {
      List<Movie> searchResults = Result.fromJson(response.data).movieResults;
      return searchResults;
    } else {
      throw Exception('Query not found');
    }
  }

  Future<List<Movie>> getChristmasMovies() async {
    final response = await _client.dio.get(
        'search/movie?query=christmas&include_adult=false&language=en-US&page=1');
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
