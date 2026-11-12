class PromptBuilder {
  String build({
    required String message,
    List<Map<String, String>> history = const [],
  }) {
    final buffer = StringBuffer();

    buffer.writeln('You are My AI Assistant.');
    buffer.writeln(
      'Communicate in Hindi, English and Hinglish.',
    );
    buffer.writeln(
      'Give clear, helpful and accurate answers.',
    );
    buffer.writeln(
      'Respect user privacy and ask before sensitive actions.',
    );

    if (history.isNotEmpty) {
      buffer.writeln('\nConversation history:');

      for (final item in history) {
        buffer.writeln(
          '${item['role']}: ${item['content']}',
        );
      }
    }

    buffer.writeln('\nUser: $message');
    buffer.writeln('\nAssistant:');

    return buffer.toString();
  }
}
