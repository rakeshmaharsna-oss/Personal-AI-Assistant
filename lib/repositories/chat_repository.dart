import '../models/chat_message.dart';

class ChatRepository {
  final List<ChatMessage> _messages = [];

  Future<void> saveMessage(ChatMessage message) async {
    _messages.removeWhere((item) => item.id == message.id);
    _messages.add(message);
  }

  Future<List<ChatMessage>> getMessages() async {
    return List.unmodifiable(_messages);
  }

  Future<void> deleteMessage(String id) async {
    _messages.removeWhere((item) => item.id == id);
  }

  Future<void> clearMessages() async {
    _messages.clear();
  }
}
