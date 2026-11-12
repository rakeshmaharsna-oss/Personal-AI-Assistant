import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/voice_screen.dart';
import '../screens/memory_screen.dart';
import '../screens/agent_screen.dart';
import '../screens/tools_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/file_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String chat = '/chat';
  static const String voice = '/voice';
  static const String memory = '/memory';
  static const String agent = '/agent';
  static const String tools = '/tools';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String files = '/files';

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case chat:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
          settings: settings,
        );

      case voice:
        return MaterialPageRoute(
          builder: (_) => const VoiceScreen(),
        );

      case memory:
        return MaterialPageRoute(
          builder: (_) => const MemoryScreen(),
        );

      case agent:
        return MaterialPageRoute(
          builder: (_) => const AgentScreen(),
        );

      case tools:
        return MaterialPageRoute(
          builder: (_) => const ToolsScreen(),
        );

      case history:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );

      case settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      case files:
        return MaterialPageRoute(
          builder: (_) => const FileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
