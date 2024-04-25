import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/details/data/details_repository.dart';
import 'package:myflix/features/details/data/webview_repository.dart';

class DetailsViewModel {
  final _logger = getLogger(DetailsViewModel);

  final ValueNotifier<List<Movie>> _similarMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get similarMovies => _similarMovies;

  Future<void> getSimilarMovies(Movie movie) async {
    try {
      final movies = await GetIt.I<DetailsRepository>().getSimilarMovies(movie);
      _similarMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }

  Future<void> movieWebview(Movie movie) async {
    await GetIt.I<WebviewRepository>().movieWebview(movie);
  }
}
