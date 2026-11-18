import 'package:flutter/material.dart';

import 'app_config.dart';
import 'theme.dart';
import '../routes/app_routes.dart';

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

      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
