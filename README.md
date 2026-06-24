# 📋 Task Management App

A clean, modern **task management mobile application** built with **Flutter** and **Dart**, designed to help users organize and track their daily tasks efficiently. The app follows the **BLoC pattern** for state management and persists data locally using **SharedPreferences**.

---

## ✨ Features

- **Create Tasks** — Quickly add tasks with a title, description, priority level, and start/end dates.
- **Edit Tasks** — Modify existing task details at any time.
- **Delete Tasks** — Remove tasks that are no longer needed.
- **Mark as Complete** — Toggle task completion status to track progress.
- **Priority Levels** — Assign priority (Low, Medium, High) to organize what matters most.
- **Local Persistence** — All tasks are saved locally using SharedPreferences, so data persists across app restarts.
- **Blog / API Integration** — Fetches posts from a REST API ([JSONPlaceholder](https://jsonplaceholder.typicode.com/posts)) to demonstrate working with remote endpoints.
- **Connectivity Awareness** — Checks network availability before making API calls and handles offline scenarios gracefully.
- **Splash & Welcome Screens** — Polished onboarding flow with a personalized greeting using the user's name.

---

## 🏗️ Architecture

The project follows a **layered architecture** with clear separation of concerns:

```
lib/
├── bloc/                   # State management (BLoC pattern)
│   ├── task/               # Task feature bloc, events & states
│   └── blog/               # Blog feature bloc, events & states
├── config/                 # App configuration
│   ├── router.dart         # GoRouter route definitions
│   └── them.dart           # Theme configuration
├── core/                   # Core utilities
│   ├── settings.dart       # SharedPreferences wrapper (CRUD operations)
│   └── utils/              # Utility extensions
│       └── string_extension.dart
├── helper/                 # Helper utilities
│   └── string_extension.dart
├── models/                 # Data models
│   ├── task_model.dart     # Task entity with serialization
│   └── blog_model.dart     # Blog post entity with serialization
├── presentation/           # UI layer
│   ├── screens/            # App screens
│   │   ├── splash_screen.dart
│   │   ├── welcome_screen.dart
│   │   ├── task_screen.dart
│   │   └── blog_screen.dart
│   └── widgets/            # Reusable UI components
│       ├── button_widget.dart
│       ├── container_widget.dart
│       ├── task_tile_widget.dart
│       ├── text_widget.dart
│       └── textfield_widget.dart
├── repositories/           # Data layer
│   └── blog_repository.dart  # API calls for blog posts
└── main.dart               # App entry point
```

---

## 🛠️ Tech Stack

| Layer              | Technology                                                                 |
|--------------------|---------------------------------------------------------------------------|
| **Framework**      | [Flutter](https://flutter.dev/) 3.x                                       |
| **Language**       | [Dart](https://dart.dev/) (SDK ^3.6.0)                                    |
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) ^9.0.0           |
| **Routing**        | [go_router](https://pub.dev/packages/go_router) ^14.8.0                  |
| **Local Storage**  | [shared_preferences](https://pub.dev/packages/shared_preferences) ^2.5.2 |
| **HTTP Client**    | [http](https://pub.dev/packages/http) ^1.3.0                             |
| **Connectivity**   | [connectivity_plus](https://pub.dev/packages/connectivity_plus) ^6.1.3   |
| **Date Formatting**| [intl](https://pub.dev/packages/intl) ^0.20.2                            |
| **Navigation Bar** | [google_nav_bar](https://pub.dev/packages/google_nav_bar) ^5.0.7        |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- [Dart SDK](https://dart.dev/get-dart) (^3.6.0)
- Android Studio / VS Code with Flutter extensions
- An Android emulator, iOS simulator, or a physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/fkirewold/Task-Management-App.git
   cd Task-Management-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Release

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

---

## 📱 App Flow

1. **Splash Screen** → Animated launch screen with app branding
2. **Welcome Screen** → User enters their name (persisted locally)
3. **Task Screen** → Main hub to create, view, edit, and manage tasks
4. **Blog Screen** → Fetches and displays posts from a REST API

---

## 📦 Key Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.0.0       # BLoC state management
  go_router: ^14.8.0         # Declarative routing
  shared_preferences: ^2.5.2 # Local key-value storage
  http: ^1.3.0               # HTTP requests
  connectivity_plus: ^6.1.3  # Network connectivity checks
  intl: ^0.20.2              # Internationalization & date formatting
  google_nav_bar: ^5.0.7     # Bottom navigation bar
  cupertino_icons: ^1.0.8    # iOS-style icons
```

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available for personal and educational use.

---

## 📚 Resources

If you're new to Flutter, here are some helpful resources:

- [Flutter Documentation](https://docs.flutter.dev/)
- [Write Your First Flutter App](https://docs.flutter.dev/get-started/codelab)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [BLoC Library Documentation](https://bloclibrary.dev/)
- [GoRouter Documentation](https://pub.dev/packages/go_router)
