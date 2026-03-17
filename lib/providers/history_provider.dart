import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../services/mock_api_service.dart';

class HistoryProvider extends ChangeNotifier {
  final MockApiService _api = MockApiService();

  List<ChatMessage> _history = [];
  bool _isLoading = false;
  String? _error;

  List<ChatMessage> get history => _history;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchHistory() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _api.getChatHistory();
      final List data = response['data'];
      _history = data.map((e) => ChatMessage.fromJson(e)).toList();
    } catch (e) {
      _error = 'Failed to load chat history.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}