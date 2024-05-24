import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/home/data/home_repository.dart';

class HomeViewModel {
  final _logger = getLogger(HomeViewModel);

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

  void setMovieLoading(bool val) {
    _moviesLoading.value = val;
  }

  Future<void> getNowPlaying() async {
    try {
      setMovieLoading(true);
      final movies = await GetIt.I<HomeRepository>().getNowPlaying();
      _trendingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
    setMovieLoading(false);
  }

  Future<void> getTopRatedMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getTopRatedMovies();
      _topRatedMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }

  Future<void> getPopularMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getPopularMovies();
      _popularMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      final movies = await GetIt.I<HomeRepository>().getUpcomingMovies();
      _upcomingMovies.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }

  Future<void> initialize() async {
    await getNowPlaying();
    await getTopRatedMovies();
    await getPopularMovies();
    await getUpcomingMovies();
  }

  Future<void> refresh() async {
    trendingMovies.value = [];
    topRatedMovies.value = [];
    popularMovies.value = [];
    upcomingMovies.value = [];
    await initialize();
  }
}
