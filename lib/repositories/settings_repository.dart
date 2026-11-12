class SettingsRepository {
  final Map<String, dynamic> _settings = {
    'language': 'Hindi',
    'voiceEnabled': true,
    'memoryEnabled': true,
    'agentEnabled': true,
    'theme': 'system',
  };

  Future<void> saveSetting(
    String key,
    dynamic value,
  ) async {
    _settings[key] = value;
  }

  Future<dynamic> getSetting(String key) async {
    return _settings[key];
  }

  Future<Map<String, dynamic>> getAllSettings() async {
    return Map.unmodifiable(_settings);
  }

  Future<void> resetSettings() async {
    _settings
      ..clear()
      ..addAll({
        'language': 'Hindi',
        'voiceEnabled': true,
        'memoryEnabled': true,
        'agentEnabled': true,
        'theme': 'system',
      });
  }
}
