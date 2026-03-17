import 'dart:async';

class MockApiService {
  static final List<Map<String, dynamic>> _allSuggestions = List.generate(30, (i) {
    final items = [
      {'title': 'Summarize my notes', 'description': 'Get a concise summary of your text'},
      {'title': 'Generate email reply', 'description': 'Create a professional email response'},
      {'title': 'Translate text', 'description': 'Translate content to another language'},
      {'title': 'Fix grammar', 'description': 'Correct grammar and spelling errors'},
      {'title': 'Write a poem', 'description': 'Generate a creative poem on any topic'},
      {'title': 'Explain a concept', 'description': 'Get a simple explanation of complex topics'},
      {'title': 'Create a to-do list', 'description': 'Organize your tasks efficiently'},
      {'title': 'Draft a message', 'description': 'Write a professional message quickly'},
      {'title': 'Code review', 'description': 'Get feedback on your code snippet'},
      {'title': 'Brainstorm ideas', 'description': 'Generate creative ideas for any project'},
    ];
    final item = items[i % items.length];
    return {'id': i + 1, 'title': item['title'], 'description': item['description']};
  });

  static final List<Map<String, dynamic>> _chatHistory = [];

  // Keyword-based smart replies
  static String _generateReply(String message) {
    final msg = message.toLowerCase();

    if (msg.contains('hi') || msg.contains('hello') || msg.contains('hey')) {
      return 'Hello! 👋 How can I assist you today?';
    } else if (msg.contains('state management') || msg.contains('provider') || msg.contains('riverpod') || msg.contains('bloc')) {
      return 'Flutter state management helps you manage UI updates efficiently. Popular solutions include Provider, Riverpod, and Bloc — each with different trade-offs in complexity and scalability.';
    } else if (msg.contains('flutter')) {
      return 'Flutter is Google\'s open-source UI toolkit for building natively compiled apps for mobile, web, and desktop from a single codebase using the Dart language.';
    } else if (msg.contains('dart')) {
      return 'Dart is the programming language used by Flutter. It\'s a strongly-typed, object-oriented language optimized for building fast apps on any platform.';
    } else if (msg.contains('widget')) {
      return 'In Flutter, everything is a widget! Widgets are the building blocks of your UI — from layout containers like Column and Row, to interactive elements like buttons and text fields.';
    } else if (msg.contains('api') || msg.contains('http') || msg.contains('request')) {
      return 'To make API calls in Flutter, you can use the http package. Use async/await with try-catch for proper error handling and loading states.';
    } else if (msg.contains('navigation') || msg.contains('route') || msg.contains('screen')) {
      return 'Flutter uses Navigator for screen transitions. You can use named routes with Navigator.pushNamed() or push a new route directly with Navigator.push().';
    } else if (msg.contains('error') || msg.contains('bug') || msg.contains('fix') || msg.contains('issue')) {
      return 'To debug Flutter issues, use flutter run with verbose logging, check the Debug Console in VS Code, and use the Flutter DevTools for widget inspection.';
    } else if (msg.contains('summarize') || msg.contains('summary') || msg.contains('notes')) {
      return 'To summarize text effectively, identify the key points, remove redundant information, and present the core ideas concisely in your own words.';
    } else if (msg.contains('email')) {
      return 'A professional email should have a clear subject, concise body, and polite tone. Start with a greeting, state your purpose early, and end with a clear call to action.';
    } else if (msg.contains('poem') || msg.contains('poetry')) {
      return 'Poetry is a beautiful form of expression! A good poem uses rhythm, imagery, and emotion to convey meaning. Would you like help writing one on a specific topic?';
    } else if (msg.contains('translate')) {
      return 'To translate text, specify the source and target language. For example: "Translate \'Good morning\' to French" → "Bonjour!"';
    } else if (msg.contains('grammar') || msg.contains('spelling')) {
      return 'Good grammar makes your writing clear and professional. Common mistakes include misusing there/their/they\'re, comma splices, and subject-verb disagreement.';
    } else if (msg.contains('to-do') || msg.contains('todo') || msg.contains('task') || msg.contains('list')) {
      return 'A good to-do list should be prioritized. Try the Eisenhower Matrix: sort tasks by urgent/important, important/not urgent, urgent/not important, and neither.';
    } else if (msg.contains('code') || msg.contains('review') || msg.contains('snippet')) {
      return 'For clean code: use meaningful variable names, keep functions small and focused, add comments where necessary, and follow the DRY (Don\'t Repeat Yourself) principle.';
    } else if (msg.contains('idea') || msg.contains('brainstorm') || msg.contains('creative')) {
      return 'Brainstorming tip: write down every idea without judgment first, then evaluate. Try mind mapping or the "Yes, and..." technique to build on initial concepts.';
    } else if (msg.contains('thank') || msg.contains('thanks')) {
      return 'You\'re welcome! Let me know if there\'s anything else I can help you with.';
    } else if (msg.contains('bye') || msg.contains('goodbye')) {
      return 'Goodbye! Have a great day! Feel free to come back anytime.';
    } else if (msg.contains('help')) {
      return 'I\'m here to help! You can ask me to summarize notes, generate email replies, explain Flutter concepts, review code, brainstorm ideas, and much more!';
    } else {
      return 'That\'s an interesting message! As your smart assistant, I\'m here to help with tasks like summarizing, drafting messages, explaining concepts, and more. Could you clarify what you need?';
    }
  }

  Future<Map<String, dynamic>> getSuggestions({int page = 1, int limit = 10}) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final totalItems = _allSuggestions.length;
    final totalPages = (totalItems / limit).ceil();
    final startIndex = (page - 1) * limit;
    final endIndex = (startIndex + limit).clamp(0, totalItems);
    final pageItems = _allSuggestions.sublist(startIndex, endIndex);

    return {
      'status': 'success',
      'data': pageItems,
      'pagination': {
        'current_page': page,
        'total_pages': totalPages,
        'total_items': totalItems,
        'limit': limit,
        'has_next': page < totalPages,
        'has_previous': page > 1,
      }
    };
  }

  // POST /chat
  Future<Map<String, dynamic>> sendMessage(String message) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final reply = _generateReply(message);

    _chatHistory.add({'sender': 'user', 'message': message});
    _chatHistory.add({'sender': 'assistant', 'message': reply});

    return {
      'status': 'success',
      'reply': reply,
    };
  }

  // GET /chat/history
  Future<Map<String, dynamic>> getChatHistory() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return {
      'status': 'success',
      'data': List.from(_chatHistory),
    };
  }
}