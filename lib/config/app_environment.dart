class AppEnvironment {
  static const String appName = 'My AI Assistant';

  static const String version = '1.0.0';

  static const String environment = 'development';

  static const bool isDevelopment =
      environment == 'development';

  static const bool isProduction =
      environment == 'production';

  static const String defaultLanguage = 'Hindi';
}
