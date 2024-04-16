import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/models/result_model.dart';
import 'package:myflix/core/utils/logger.dart';

class HomeRepository {
  final ApiClient _client;

//
  HomeRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  late final _logger = getLogger(HomeRepository);

  Future<List<Movie>> getNowPlaying() async {
    final response =
        await _client.dio.get('movie/now_playing?language=en-US&page=1');
    _logger.log("this is response statuscode: ${response.statusCode}");
    _logger.log("this is response: $response");
    _logger.log("this is response type: ${response.runtimeType}");

    if (response.statusCode == 200) {
      List<Movie> movies = Result.fromJson(response.data).movieResults;
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response =
        await _client.dio.get('movie/top_rated?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = Result.fromJson(response.data).movieResults;
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response =
        await _client.dio.get('movie/popular?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = Result.fromJson(response.data).movieResults;
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response =
        await _client.dio.get('movie/upcoming?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = Result.fromJson(response.data).movieResults;
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }
}
