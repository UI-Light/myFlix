import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/models/result_model.dart';
import 'package:myflix/core/utils/logger.dart';

class DetailsRepository {
  final ApiClient _client;

  DetailsRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  late final _logger = getLogger(DetailsRepository);

  Future<List<Movie>> getSimilarMovies(Movie movie) async {
    final response = await _client.dio
        .get('movie/${movie.movieId}/similar?language=en-US&page=1');
    _logger.log("this is response statuscode: ${response.statusCode}");
    _logger.log("this is response: $response");
    _logger.log("this is response type: ${response.runtimeType}");

    if (response.statusCode == 200) {
      List<Movie> movies = Result.fromJson(response.data).movieResults;
      return movies;
    } else {
      throw Exception('Cannot load similar movies');
    }
  }
}
