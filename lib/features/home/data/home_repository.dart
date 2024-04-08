import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';

class HomeRepository {
  final ApiClient _client;

//
  HomeRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  late final _logger = getLogger(HomeRepository);

  Future<List<Movie>> getNowPlaying() async {
    final response = await _client.dio.get('now_playing?language=en-US&page=1');
    _logger.log("this is response statuscode: ${response.statusCode}");
    _logger.log("this is response: $response");
    _logger.log("this is response type: ${response.runtimeType}");

    if (response.statusCode == 200) {
      List<Movie> movies = List<Movie>.from(
        response.data.map((element) => Movie.fromJson(element)),
      );
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await _client.dio.get('top_rated?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = List<Movie>.from(
        response.data.map((element) => Movie.fromJson(element)),
      );
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await _client.dio.get('popular?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = List<Movie>.from(
        response.data.map((element) => Movie.fromJson(element)),
      );
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await _client.dio.get('upcoming?language=en-US&page=1');

    if (response.statusCode == 200) {
      List<Movie> movies = List<Movie>.from(
        response.data.map((element) => Movie.fromJson(element)),
      );
      return movies;
    } else {
      throw Exception('Cannot load movies data');
    }
  }
}
