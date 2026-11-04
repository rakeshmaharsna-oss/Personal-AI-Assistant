
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final ValueChanged<String> onSend;
  final VoidCallback? onMicTap;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onMicTap,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController controller =
      TextEditingController();

  void sendMessage() {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    widget.onSend(text);
    controller.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline),
            color: const Color(0xFF3978F6),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => sendMessage(),
              decoration: const InputDecoration(
                hintText: 'Ask me anything...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: widget.onMicTap,
            icon: const Icon(Icons.mic_none_rounded),
            color: const Color(0xFF3978F6),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send_rounded),
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF3978F6),
            ),
          ),
        ],
      ),
    );
  }
}
