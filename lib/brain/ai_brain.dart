import 'model_manager.dart';
import 'prompt_builder.dart';
import 'context_manager.dart';
import 'response_handler.dart';

class AiBrain {
  final ModelManager modelManager;
  final PromptBuilder promptBuilder;
  final ContextManager contextManager;
  final ResponseHandler responseHandler;

  AiBrain({
    required this.modelManager,
    required this.promptBuilder,
    required this.contextManager,
    required this.responseHandler,
  });

  Future<String> ask(String message) async {
    if (message.trim().isEmpty) {
      return 'कृपया अपना सवाल लिखें।';
    }

    try {
      final prompt = promptBuilder.build(
        message: message,
        history: contextManager.history,
      );

      final response = await modelManager.generate(prompt);

      final answer = responseHandler.handle(response);

      contextManager.addMessage('user', message);
      contextManager.addMessage('assistant', answer);

      return answer;
    } catch (error) {
      return 'माफ़ कीजिए, AI से जवाब प्राप्त नहीं हुआ। कृपया दोबारा कोशिश करें।';
    }
  }

  void clearConversation() {
    contextManager.clear();
  }
}
