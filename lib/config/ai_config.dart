class AiConfig {
  static const String defaultProvider = 'gemini';

  static const String openAiProvider = 'chatgpt';

  static const String geminiProvider = 'gemini';

  static const String deepSeekProvider = 'deepseek';

  static const Map<String, String> providers = {
    'chatgpt': 'OpenAI',
    'gemini': 'Google Gemini',
    'deepseek': 'DeepSeek',
  };

  static const int maxTokens = 2048;

  static const double temperature = 0.7;

  static const Duration requestTimeout =
      Duration(seconds: 60);
}
