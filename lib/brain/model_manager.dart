
import 'dart:convert';
import 'dart:io';

enum AiModel {
  chatgpt,
  gemini,
  deepseek,
}

class ModelManager {
  AiModel selectedModel = AiModel.gemini;

  static const String backendUrl =
      'https://personal-ai-assistant-fjoi.onrender.com';

  Future<String> generate(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw ArgumentError('Prompt cannot be empty.');
    }

    final provider = switch (selectedModel) {
      AiModel.chatgpt => 'chatgpt',
      AiModel.gemini => 'gemini',
      AiModel.deepseek => 'deepseek',
    };

    final client = HttpClient();

    try {
      final uri = Uri.parse('$backendUrl/api/chat');

      final request = await client.postUrl(uri).timeout(
        const Duration(seconds: 120),
      );

      request.headers.contentType = ContentType.json;

      request.add(
        utf8.encode(
          jsonEncode({
            'provider': provider,
            'message': prompt.trim(),
            'history': [],
          }),
        ),
      );

      final response = await request.close().timeout(
        const Duration(seconds: 120),
      );

      final responseBody = await response
          .transform(utf8.decoder)
          .join();

      final data = jsonDecode(responseBody);

      if (response.statusCode != 200) {
        final error = data is Map
            ? data['error']?.toString()
            : null;

        throw Exception(
          error ?? 'AI request failed: ${response.statusCode}',
        );
      }

      if (data is! Map || data['success'] != true) {
        throw Exception('Invalid response from AI server.');
      }

      final answer = data['answer'];

      if (answer is! String || answer.trim().isEmpty) {
        throw Exception('AI returned an empty response.');
      }

      return answer.trim();
    } on SocketException {
      throw Exception('Internet connection is not available.');
    } on HttpException {
      throw Exception('Could not connect to AI server.');
    } on FormatException {
      throw Exception('Invalid response received from AI server.');
    } catch (error) {
      throw Exception('AI connection failed: $error');
    } finally {
      client.close(force: true);
    }
  }

  void selectModel(AiModel model) {
    selectedModel = model;
  }
}
