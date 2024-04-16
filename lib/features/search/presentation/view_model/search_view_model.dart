import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/search/data/search_repository.dart';

class SearchViewModel {
  final _logger = getLogger(SearchViewModel);
  final SearchRepository _searchRepository = SearchRepository();

  final ValueNotifier<List<Movie>> _searchresults = ValueNotifier([]);
  ValueNotifier<List<Movie>> get searchresults => _searchresults;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier get isLoading => _isLoading;

  void setLoading(bool val) {
    isLoading.value = val;
  }

  Future<void> searchMovie(String keyword) async {
    try {
      setLoading(true);
      final movies = await _searchRepository.searchMovie(keyword);
      _searchresults.value = movies;
    } catch (e) {
      _logger.log(e);
    }
    setLoading(false);
  }

  Future<void> getChristmasMovies() async {
    try {
      final movies = await _searchRepository.getChristmasMovies();
      _searchresults.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }
}
