class VoiceService {
  bool isListening = false;
  bool isSpeaking = false;

  Future<void> startListening() async {
    throw UnimplementedError(
      'Speech recognition will be added later.',
    );
  }

  Future<void> stopListening() async {
    isListening = false;
  }

  Future<void> speak(String text) async {
    if (text.trim().isEmpty) return;

    throw UnimplementedError(
      'Text to speech will be added later.',
    );
  }

  Future<void> stopSpeaking() async {
    isSpeaking = false;
  }
}
