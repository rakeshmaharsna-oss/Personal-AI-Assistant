class ResponseHandler {
  String handle(String response) {
    final cleanedResponse = response.trim();

    if (cleanedResponse.isEmpty) {
      return 'माफ़ कीजिए, मुझे कोई जवाब नहीं मिला।';
    }

    return cleanedResponse;
  }

  bool isValidResponse(String response) {
    return response.trim().isNotEmpty;
  }
}
