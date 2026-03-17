# Smart Assistant App 

A Flutter-based Smart Assistant mobile application that simulates an AI assistant experience with suggestions, chat, and history features with dummy API.

---

##  Architecture
```
lib/
├── main.dart                  # Entry point
├── app.dart                   # App root with MultiProvider & routing
├── models/
│   ├── suggestion.dart        # Suggestion model
│   ├── chat_message.dart      # ChatMessage model
│   └── pagination.dart        # Pagination model
├── services/
│   └── mock_api_service.dart  # Simulated REST API
├── providers/
│   ├── suggestions_provider.dart  # Suggestions state + pagination
│   ├── chat_provider.dart         # Chat state + send message
│   ├── history_provider.dart      # Chat history state
│   └── theme_provider.dart        # Dark/light theme toggle
├── screens/
│   ├── home_screen.dart       # Suggestions list 
│   ├── chat_screen.dart       # Chat UI with input and bubbles
│   └── history_screen.dart    # Previous chat messages
├── widgets/
│   ├── suggestion_card.dart   # Reusable suggestion card
│   ├── chat_bubble.dart       # Reusable chat bubble
│   └── loading_indicator.dart # Reusable loading widget
└── themes/
    └── app_theme.dart         # Light & dark ThemeData
```

---

##  Setup Steps

### Prerequisites
- Flutter SDK (latest stable) installed
- Android Studio or VS Code with Flutter & Dart extensions
- Android device or emulator

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/YOUR_USERNAME/smart_assistant_app.git
   cd smart_assistant_app
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Run the app**
```bash
# MOBILE
   flutter run
# WEB
   flutter run -d chrome
```

---

##  Dependencies

| Package | Purpose |
|---|---|
| `provider: ^6.1.1` | State management |
| `google_fonts: ^6.2.1` | Outfit & Poppins fonts |
| `shared_preferences: ^2.2.2` | Local storage (bonus) |
| `http: ^1.2.0` | HTTP client |

---

## Features

- **Home Screen** — Paginated suggestions list with infinite scroll & pull-to-refresh
- **Chat Screen** — Real-time chat UI with typing indicator and quick-reply chips
- **History Screen** — View all previous chat messages
- **Dark Mode** — Toggle dark/light theme from the drawer
- **Responsive UI** — Works on Android, iOS and Web
- **State Management** — Clean Provider pattern throughout

---

##  State Management

This app uses the **Provider** package for state management:

- `SuggestionsProvider` — manages suggestions list, pagination, loading & error states
- `ChatProvider` — manages chat messages, sending state, clears on new chat
- `HistoryProvider` — manages chat history fetching
- `ThemeProvider` — manages dark/light mode toggle

---

##  Bonus Features Implemented

- ✅ Dark mode support
- ✅ Smooth animations (typing dots, collapsible header)
- ✅ Keyword-based smart replies

---

##  Developed By

**Atharv Sawant**