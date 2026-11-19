
import 'package:flutter/material.dart';

import '../brain/ai_brain.dart';
import '../brain/model_manager.dart';
import '../brain/prompt_builder.dart';
import '../brain/context_manager.dart';
import '../brain/response_handler.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  late final ModelManager modelManager;
  late final AiBrain aiBrain;

  final List<Map<String, String>> messages = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    modelManager = ModelManager();

    aiBrain = AiBrain(
      modelManager: modelManager,
      promptBuilder: PromptBuilder(),
      contextManager: ContextManager(),
      responseHandler: ResponseHandler(),
    );
  }

  String get modelName {
    switch (modelManager.selectedModel) {
      case AiModel.chatgpt:
        return 'ChatGPT';
      case AiModel.gemini:
        return 'Gemini';
      case AiModel.deepseek:
        return 'DeepSeek';
    }
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();

    if (text.isEmpty || isLoading) return;

    controller.clear();

    setState(() {
      messages.add({
        'role': 'user',
        'content': text,
      });
      isLoading = true;
    });

    _scrollToBottom();

    try {
      final answer = await aiBrain.ask(text);

      if (!mounted) return;

      setState(() {
        messages.add({
          'role': 'assistant',
          'content': answer,
        });
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        messages.add({
          'role': 'assistant',
          'content': 'माफ़ कीजिए, जवाब नहीं मिला। दोबारा कोशिश करें।',
        });
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        _scrollToBottom();
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void changeModel(AiModel? model) {
    if (model == null) return;

    setState(() {
      modelManager.selectModel(model);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My AI Assistant',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownButton<AiModel>(
            value: modelManager.selectedModel,
            underline: const SizedBox(),
            onChanged: isLoading ? null : changeModel,
            items: const [
              DropdownMenuItem(
                value: AiModel.chatgpt,
                child: Text('ChatGPT'),
              ),
              DropdownMenuItem(
                value: AiModel.gemini,
                child: Text('Gemini'),
              ),
              DropdownMenuItem(
                value: AiModel.deepseek,
                child: Text('DeepSeek'),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          size: 65,
                          color: Color(0xFF3978F6),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Hello! How can I help you?',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Selected AI: $modelName',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final message = messages[index];
                      final isUser = message['role'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 0.82,
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isUser
                                ? const Color(0xFF3978F6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: isUser
                                ? null
                                : Border.all(
                                    color: const Color(0xFFE3EAF5),
                                  ),
                          ),
                          child: Text(
                            message['content'] ?? '',
                            style: TextStyle(
                              color: isUser
                                  ? Colors.white
                                  : const Color(0xFF172033),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0xFFE3EAF5),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      enabled: !isLoading,
                      minLines: 1,
                      maxLines: 5,
                      onSubmitted: (_) => sendMessage(),
                      decoration: const InputDecoration(
                        hintText: 'Ask me anything...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: isLoading ? null : sendMessage,
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.white,
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF3978F6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
