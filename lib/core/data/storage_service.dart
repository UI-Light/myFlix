import 'package:hive_flutter/adapters.dart';
import 'package:myflix/core/models/movie_model.dart';

class StorageService {
  Future initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    await Hive.openBox<Movie>('watchListBox');
  }

  // Future<List<Movie>> fetchWatchList() async {
  //   Box<Movie> box = Hive.box<Movie>('watchListBox');
  //   box.get(key)
  // }

  Future<void> addToWatchlist() async {
    //add to watchList
  }

  Future<void> removeFromWatchlist() async {
    //remove from watchlist
  }
}
