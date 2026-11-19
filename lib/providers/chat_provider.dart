
import 'package:flutter/foundation.dart';

import '../models/chat_message.dart';
import '../brain/ai_brain.dart';

class ChatProvider extends ChangeNotifier {
  final AiBrain aiBrain;

  ChatProvider({
    required this.aiBrain,
  });

  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages =>
      List.unmodifiable(_messages);

  bool isLoading = false;
  String? errorMessage;

  Future<void> sendMessage(String text) async {
    final userText = text.trim();

    if (userText.isEmpty || isLoading) return;

    final now = DateTime.now();

    _messages.add(
      ChatMessage(
        id: now.microsecondsSinceEpoch.toString(),
        text: userText,
        role: MessageRole.user,
        createdAt: now,
      ),
    );

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await aiBrain.ask(userText);

      _messages.add(
        ChatMessage(
          id: DateTime.now()
              .microsecondsSinceEpoch
              .toString(),
          text: response,
          role: MessageRole.assistant,
          createdAt: DateTime.now(),
        ),
      );
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    aiBrain.clearConversation();
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }
}
