import 'package:flutter/material.dart';

import 'app_config.dart';
import 'theme.dart';

class PersonalAIAssistant extends StatelessWidget {
  const PersonalAIAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      home: const Scaffold(
        body: Center(
          child: Text(
            'My AI Assistant',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
