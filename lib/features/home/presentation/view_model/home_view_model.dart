import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/connectivity_service.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/home/data/home_repository.dart';

class HomeViewModel {
  final _logger = getLogger(HomeViewModel);
  final connectivityService = ConnectivityService();

  final ValueNotifier<List<Movie>> _trendingMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get trendingMovies => _trendingMovies;

  final ValueNotifier<List<Movie>> _topRatedMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get topRatedMovies => _topRatedMovies;

  final ValueNotifier<List<Movie>> _popularMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get popularMovies => _popularMovies;

  final ValueNotifier<List<Movie>> _upcomingMovies = ValueNotifier([]);
  ValueNotifier<List<Movie>> get upcomingMovies => _upcomingMovies;

  final ValueNotifier<bool> _moviesLoading = ValueNotifier(false);
  ValueNotifier<bool> get moviesLoading => _moviesLoading;

  int count = 0;

  final ValueNotifier<bool> _hasError = ValueNotifier(false);
  ValueNotifier<bool> get hasError => _hasError;

  void setMovieLoading(bool val) {
    _moviesLoading.value = val;
  }

  Future<void> getNowPlaying() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getNowPlaying();
      _trendingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
      count += 1;
      checkForException();
    }
  }

  Future<void> getTopRatedMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getTopRatedMovies();
      _topRatedMovies.value = movies;
    } catch (e) {
      _logger.log(e);
      count += 1;
      checkForException();
    }
  }

  Future<void> getPopularMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getPopularMovies();
      _popularMovies.value = movies;
    } catch (e) {
      _logger.log(e);
      count += 1;
      checkForException();
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getUpcomingMovies();
      _upcomingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
      count += 1;
      checkForException();
    }
  }

  Future<void> initialize() async {
    setMovieLoading(true);
    await getNowPlaying();
    await getTopRatedMovies();
    await getPopularMovies();
    await getUpcomingMovies();
    setMovieLoading(false);
  }

  Future<void> refresh() async {
    count = 0;
    _hasError.value = false;
    trendingMovies.value = [];
    topRatedMovies.value = [];
    popularMovies.value = [];
    upcomingMovies.value = [];
    await initialize();
  }

  void checkForException() {
    _hasError.value = count == 4;
  }
}
