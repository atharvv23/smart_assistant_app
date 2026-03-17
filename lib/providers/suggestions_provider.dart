import 'package:flutter/material.dart';
import '../models/suggestion.dart';
import '../models/pagination.dart';
import '../services/mock_api_service.dart';

class SuggestionsProvider extends ChangeNotifier {
  final MockApiService _api = MockApiService();

  List<Suggestion> _suggestions = [];
  Pagination? _pagination;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  int _currentPage = 1;
  final int _limit = 20;

  List<Suggestion> get suggestions => _suggestions;
  Pagination? get pagination => _pagination;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;

  Future<void> fetchSuggestions({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _suggestions = [];
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _api.getSuggestions(page: _currentPage, limit: _limit);
      final List data = response['data'];
      _suggestions = data.map((e) => Suggestion.fromJson(e)).toList();
      _pagination = Pagination.fromJson(response['pagination']);
    } catch (e) {
      _error = 'Failed to load suggestions. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadNextPage() async {
    if (_pagination == null || !_pagination!.hasNext || _isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      _currentPage++;
      final response = await _api.getSuggestions(page: _currentPage, limit: _limit);
      final List data = response['data'];
      _suggestions.addAll(data.map((e) => Suggestion.fromJson(e)));
      _pagination = Pagination.fromJson(response['pagination']);
    } catch (e) {
      _currentPage--;
      _error = 'Failed to load more suggestions.';
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}