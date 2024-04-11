class Movie {
  final String movieTitle, posterUrl, backdropUrl, overview;
  final String year;
  final double averageRating;

  const Movie({
    required this.movieTitle,
    required this.posterUrl,
    required this.backdropUrl,
    required this.overview,
    required this.year,
    required this.averageRating,
  });

  factory Movie.fromJson(Map<String, dynamic> data) {
    return Movie(
        movieTitle: data['original_title'],
        posterUrl: _mediaBaseUrl + data['poster_path'],
        backdropUrl: _mediaBaseUrl + data['backdrop_path'],
        overview: data['overview'],
        year: data['release_date'],
        averageRating: data['vote_average']);
  }

  static const String _mediaBaseUrl = "https://image.tmdb.org/t/p/original";
}
