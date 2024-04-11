import 'package:myflix/core/models/movie_model.dart';

class Result {
  final int pageNumber;
  final List<Movie> movieResults;

  const Result({
    required this.pageNumber,
    required this.movieResults,
  });

  factory Result.fromJson(Map<String, dynamic> data) {
    final list = data['results'] as List<dynamic>;
    final movies = list
        .map(
          (e) => Movie.fromJson(e),
        )
        .toList();
    return Result(pageNumber: data['page'], movieResults: movies);
  }
}
