class AiService {
  bool get isConnected => false;

  Future<String> sendMessage(String message) async {
    if (message.trim().isEmpty) {
      throw ArgumentError('Message cannot be empty');
    }

    throw UnimplementedError(
      'AI API connection will be added later.',
    );
  }

  Future<void> disconnect() async {
    // AI connection cleanup will be added later.
  }
}
