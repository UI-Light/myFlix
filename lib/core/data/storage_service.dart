import 'package:hive_flutter/adapters.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/constants.dart';
import 'package:myflix/core/utils/logger.dart';

class StorageService {
  final _logger = getLogger(StorageService);

  final Box<Movie> _movieBox = Hive.box<Movie>(boxName);
  Box<Movie> get movieBox => _movieBox;

  Future<List<Movie>> fetchWatchList() async {
    _logger.log('This is get key: ${movieBox.keys}');
    final List<Movie> movies = [];
    final keysList = movieBox.keys.toList();
    for (int i = 0; i < keysList.length; i++) {
      movies.add(movieBox.get(keysList[i])!);
    }
    return movies;
  }

  Future<void> addToWatchlist(Movie movie) async {
    await movieBox.add(movie);
    _logger.log('This is add key: ${movieBox.keys}');
  }

  Future<void> removeFromWatchList(Movie movie) async {
    final keylist = movieBox.keys.toList();
    for (int i = 0; i < keylist.length; i++) {
      final currentMovie = movieBox.get(keylist[i]);
      if (currentMovie!.movieId == movie.movieId) {
        movieBox.delete(keylist[i]);
        break;
      }
    }
    _logger.log('keys after removal: ${movieBox.keys}');
  }

  Future<bool> movieInWatchList(Movie movie) async {
    final List<Movie> watchlist = await fetchWatchList();
    return watchlist.any((element) => element.movieId == movie.movieId);
  }
}
