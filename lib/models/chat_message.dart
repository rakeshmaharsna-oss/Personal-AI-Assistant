enum MessageRole { user, assistant, system }

class ChatMessage {
  final String id;
  final String text;
  final MessageRole role;
  final DateTime createdAt;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.role,
    required this.createdAt,
  });
}
