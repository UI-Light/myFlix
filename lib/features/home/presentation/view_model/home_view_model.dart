import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/home/data/home_repository.dart';

class HomeViewModel {
  final _logger = getLogger(HomeViewModel);

  final ValueNotifier<List<Movie>> _trendingMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get trendingMovies => _trendingMovies;

  final ValueNotifier<bool> _trendingMoviesLoading = ValueNotifier(false);
  ValueNotifier<bool> get trendingMoviesLoading => _trendingMoviesLoading;

  final ValueNotifier<List<Movie>> _topRatedMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get topRatedMovies => _topRatedMovies;

  final ValueNotifier<bool> _topRatedMoviesLoading = ValueNotifier(false);
  ValueNotifier<bool> get topRatedMoviesloading => _topRatedMoviesLoading;

  final ValueNotifier<List<Movie>> _popularMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get popularMovies => _popularMovies;

  final ValueNotifier<bool> _popularMoviesLoading = ValueNotifier(false);
  ValueNotifier<bool> get popularMoviesLoading => _popularMoviesLoading;

  final ValueNotifier<List<Movie>> _upcomingMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get upcomingMovies => _upcomingMovies;

  final ValueNotifier<bool> _upcomingMoviesLoading = ValueNotifier(false);
  ValueNotifier<bool> get upcomingMoviesLoading => _upcomingMoviesLoading;

  void upcomingMovieLoading(bool val) {
    _upcomingMoviesLoading.value = val;
  }

  void popularMovieLoading(bool val) {
    _popularMoviesLoading.value = val;
  }

  void topRatedMovieLoading(bool val) {
    _topRatedMoviesLoading.value = val;
  }

  void trendingMovieLoading(bool val) {
    _trendingMoviesLoading.value = val;
  }

  Future<void> getNowPlaying() async {
    try {
      trendingMovieLoading(true);
      final movies = await GetIt.I<HomeRepository>().getNowPlaying();
      _trendingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
    trendingMovieLoading(false);
  }

  Future<void> getTopRatedMovies() async {
    try {
      topRatedMovieLoading(true);
      final movies = await GetIt.I<HomeRepository>().getTopRatedMovies();
      _topRatedMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
    topRatedMovieLoading(false);
  }

  Future<void> getPopularMovies() async {
    try {
      popularMovieLoading(true);
      final movies = await GetIt.I<HomeRepository>().getPopularMovies();
      _popularMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
    popularMovieLoading(false);
  }

  Future<void> getUpcomingMovies() async {
    try {
      upcomingMovieLoading(true);
      final movies = await GetIt.I<HomeRepository>().getUpcomingMovies();
      _upcomingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }
}
