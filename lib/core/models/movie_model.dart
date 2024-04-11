class Movie {
  final String movieTitle, posterUrl, overview;
  final String? backdropUrl;
  final String year;
  final num averageRating;
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
        posterUrl: _mediaBaseUrl + data['poster_path'],
        backdropUrl: _mediaBaseUrl + data['backdrop_path'] ?? 'Unavailable',
        overview: data['overview'],
        year: data['release_date'],
        averageRating: data['vote_average']);
  }

  static const String _mediaBaseUrl = "https://image.tmdb.org/t/p/original";
}
