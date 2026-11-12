import 'package:flutter/foundation.dart';

class SettingsProvider extends ChangeNotifier {
  String _language = 'Hindi';

  bool _voiceEnabled = true;
  bool _memoryEnabled = true;
  bool _agentEnabled = true;

  String get language => _language;

  bool get voiceEnabled => _voiceEnabled;

  bool get memoryEnabled => _memoryEnabled;

  bool get agentEnabled => _agentEnabled;

  void setLanguage(String language) {
    _language = language;
    notifyListeners();
  }

  void setVoiceEnabled(bool value) {
    _voiceEnabled = value;
    notifyListeners();
  }

  void setMemoryEnabled(bool value) {
    _memoryEnabled = value;
    notifyListeners();
  }

  void setAgentEnabled(bool value) {
    _agentEnabled = value;
    notifyListeners();
  }

  void resetSettings() {
    _language = 'Hindi';
    _voiceEnabled = true;
    _memoryEnabled = true;
    _agentEnabled = true;

    notifyListeners();
  }
}
