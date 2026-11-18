
class PromptBuilder {
  String build({
    required String message,
    List<Map<String, String>> history = const [],
  }) {
    final buffer = StringBuffer();

    buffer.writeln(
      'You are My AI Assistant, a helpful and intelligent assistant.',
    );

    buffer.writeln(
      'Communicate naturally in Hindi, English, or Hinglish.',
    );

    buffer.writeln(
      'Prefer the language used by the user.',
    );

    buffer.writeln(
      'Give clear, accurate, useful and easy-to-understand answers.',
    );

    buffer.writeln(
      'If you do not know something, say so honestly.',
    );

    buffer.writeln(
      'Respect user privacy and never reveal API keys or secrets.',
    );

    buffer.writeln(
      'Never claim to perform an action unless it was actually completed.',
    );

    buffer.writeln(
      'Ask for user approval before sensitive actions.',
    );

    if (history.isNotEmpty) {
      buffer.writeln('\nConversation history:');

      for (final item in history) {
        final role = item['role'] ?? 'unknown';
        final content = item['content'] ?? '';

        buffer.writeln('$role: $content');
      }
    }

    buffer.writeln('\nCurrent user message:');
    buffer.writeln(message.trim());

    buffer.writeln('\nAssistant response:');

    return buffer.toString();
  }
}
