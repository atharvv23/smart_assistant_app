import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../services/mock_api_service.dart';

class ChatProvider extends ChangeNotifier {
  final MockApiService _api = MockApiService();

  List<ChatMessage> _messages = [];
  bool _isSending = false;
  String? _error;

  List<ChatMessage> get messages => _messages;
  bool get isSending => _isSending;
  String? get error => _error;

  void clearMessages() {
    _messages = [];
    _error = null;
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    _messages.add(ChatMessage(sender: 'user', message: text.trim()));
    _isSending = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _api.sendMessage(text.trim());
      final reply = response['reply'] as String;
      _messages.add(ChatMessage(sender: 'assistant', message: reply));
    } catch (e) {
      _error = 'Failed to send message. Please try again.';
      _messages.removeLast();
    } finally {
      _isSending = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}