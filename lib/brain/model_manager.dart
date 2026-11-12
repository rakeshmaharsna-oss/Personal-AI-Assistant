enum AiModel {
  chatgpt,
  gemini,
  deepseek,
}

class ModelManager {
  AiModel selectedModel = AiModel.gemini;

  Future<String> generate(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw ArgumentError('Prompt cannot be empty.');
    }

    switch (selectedModel) {
      case AiModel.chatgpt:
        throw UnimplementedError(
          'OpenAI API connection is not configured.',
        );

      case AiModel.gemini:
        throw UnimplementedError(
          'Gemini API connection is not configured.',
        );

      case AiModel.deepseek:
        throw UnimplementedError(
          'DeepSeek API connection is not configured.',
        );
    }
  }

  void selectModel(AiModel model) {
    selectedModel = model;
  }
}
