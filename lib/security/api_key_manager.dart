import 'secure_storage_service.dart';

class ApiKeyManager {
  final SecureStorageService storage;

  ApiKeyManager({required this.storage});

  static const String openAiKey = 'openai_api_key';
  static const String geminiKey = 'gemini_api_key';
  static const String deepSeekKey = 'deepseek_api_key';

  Future<void> saveApiKey({
    required String provider,
    required String apiKey,
  }) async {
    if (apiKey.trim().isEmpty) {
      throw ArgumentError('API Key cannot be empty.');
    }

    final keyName = _getKeyName(provider);

    await storage.save(
      key: keyName,
      value: apiKey.trim(),
    );
  }

  Future<String?> getApiKey(String provider) async {
    return storage.read(_getKeyName(provider));
  }

  Future<void> deleteApiKey(String provider) async {
    await storage.delete(_getKeyName(provider));
  }

  String _getKeyName(String provider) {
    switch (provider.toLowerCase()) {
      case 'openai':
      case 'chatgpt':
        return openAiKey;

      case 'gemini':
        return geminiKey;

      case 'deepseek':
        return deepSeekKey;

      default:
        throw ArgumentError('Unknown AI provider: $provider');
    }
  }
}
