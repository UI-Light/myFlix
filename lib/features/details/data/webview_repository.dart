import 'package:dio/dio.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';

class WebviewRepository {
  late final _logger = getLogger(WebviewRepository);

  late final Dio _client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      baseUrl: const String.fromEnvironment('MOVIE_EMBED_URL'),
    ),
  );

  Future<void> movieWebview(Movie movie) async {
    try {
      final response = await _client.get('${movie.movieId}');
      _logger.log("this is response statuscode: ${response.statusCode}");
      _logger.log("this is response: $response");
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      _logger.log(e);
    }
  }
}
