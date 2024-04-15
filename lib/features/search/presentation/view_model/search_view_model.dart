import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/search/data/search_repository.dart';

class SearchViewModel {
  final _logger = getLogger(SearchViewModel);
  final SearchRepository _searchRepository = SearchRepository();

  final ValueNotifier<List<Movie>> _searchresults = ValueNotifier([]);
  ValueNotifier<List<Movie>> get searchresults => _searchresults;

  Future<void> searchMovie(String keyword) async {
    try {
      final movies = await _searchRepository.searchMovie(keyword);
      _searchresults.value = movies;
    } catch (e) {
      _logger.log(e);
    }
  }
}
