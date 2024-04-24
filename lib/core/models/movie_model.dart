import 'package:hive/hive.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final String movieTitle;

  @HiveField(1)
  final String posterUrl;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String backdropUrl;

  @HiveField(4)
  final String year;

  @HiveField(5)
  final num averageRating;

  @HiveField(6)
  final int movieId;

  const Movie({
    required this.movieTitle,
    required this.posterUrl,
    required this.backdropUrl,
    required this.overview,
    required this.year,
    required this.averageRating,
    required this.movieId,
  });

  factory Movie.fromJson(Map<String, dynamic> data) {
    return Movie(
        movieId: data['id'],
        movieTitle: data['original_title'],
        posterUrl: data['poster_path'] == null
            ? 'Unavailable'
            : _mediaBaseUrl + data['poster_path'],
        backdropUrl: data['backdrop_path'] == null
            ? 'Unavailable'
            : _mediaBaseUrl + data['backdrop_path'],
        overview: data['overview'],
        year: data['release_date'],
        averageRating: data['vote_average']);
  }

  static const String _mediaBaseUrl = "https://image.tmdb.org/t/p/original";
}
