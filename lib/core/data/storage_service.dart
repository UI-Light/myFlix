import 'package:hive_flutter/adapters.dart';
import 'package:myflix/core/models/movie_model.dart';

class StorageService {
  String key = 'movies';

  Future<List<Movie>> fetchWatchList() async {
    Box<Movie> movieBox = Hive.box<Movie>('watchListBox');
    return movieBox.values.toList();
    // final movies = movieBox.get(key);
    // return movies;
  }

  Future<void> addToWatchlist(Movie movie) async {
    Box<Movie> movieBox = Hive.box<Movie>('watchListBox');
    //   await movieBox.put(key, movie);
    await movieBox.add(movie);
  }

  Future<void> removeFromWatchlist(Movie movie) async {
    Box<Movie> movieBox = Hive.box<Movie>('watchListBox');
    //movieBox.delete(movie);
    final moviesList = movieBox.values.toList();
    moviesList.removeWhere((element) => element.movieId == movie.movieId);
  }

  Future<bool> movieInWatchList(Movie movie) async {
    final List<Movie> watchlist = await fetchWatchList();
    return watchlist.any((element) => element.movieId == movie.movieId);
  }
}
