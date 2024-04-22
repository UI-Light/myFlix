import 'package:flutter/material.dart';
import 'package:myflix/core/data/storage_service.dart';
import 'package:myflix/core/models/movie_model.dart';

class WatchListViewModel {
  final StorageService _storageService = StorageService();

  final ValueNotifier<List<Movie>> _watchListNotifier = ValueNotifier([]);
  ValueNotifier<List<Movie>> get watchListNotifier => _watchListNotifier;

  Future<void> getWatchList() async {
    _watchListNotifier.value = await _storageService.fetchWatchList();
  }

  Future<void> addToWatchList(Movie movie) async {
    await _storageService.addToWatchlist(movie);
    await getWatchList();
  }

  Future<void> removeFromWatchList(Movie movie) async {
    await _storageService.removeFromWatchlist(movie);
    await getWatchList();
  }

  Future<bool> movieInWatchlist(Movie movie) async {
    return await _storageService.movieInWatchList(movie);
  }

  void showSnackbar(BuildContext context, String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
