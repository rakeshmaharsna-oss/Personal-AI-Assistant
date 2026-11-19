
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final ValueChanged<String> onSend;
  final VoidCallback? onMicTap;
  final VoidCallback? onAttachmentTap;
  final bool isLoading;
  final bool enabled;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onMicTap,
    this.onAttachmentTap,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController controller =
      TextEditingController();

  void sendMessage() {
    final text = controller.text.trim();

    if (text.isEmpty ||
        widget.isLoading ||
        !widget.enabled) {
      return;
    }

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
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: widget.enabled
                ? widget.onAttachmentTap
                : null,
            icon: const Icon(Icons.add_circle_outline),
            color: const Color(0xFF3978F6),
            tooltip: 'Attach file',
          ),

          Expanded(
            child: TextField(
              controller: controller,
              enabled: widget.enabled && !widget.isLoading,
              minLines: 1,
              maxLines: 5,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => sendMessage(),
              decoration: const InputDecoration(
                hintText: 'Ask me anything...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: widget.enabled
                ? widget.onMicTap
                : null,
            icon: const Icon(Icons.mic_none_rounded),
            color: const Color(0xFF3978F6),
            tooltip: 'Voice input',
          ),

          IconButton(
            onPressed: widget.isLoading || !widget.enabled
                ? null
                : sendMessage,
            icon: widget.isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.send_rounded),
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF3978F6),
            ),
            tooltip: 'Send message',
          ),
        ],
      ),
    );
  }
}
