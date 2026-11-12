class InputSanitizer {
  static String clean(String input) {
    return input
        .replaceAll('\u0000', '')
        .trim();
  }

  static bool isValid(String input) {
    return clean(input).isNotEmpty;
  }

  static String limitLength(
    String input, {
    int maxLength = 10000,
  }) {
    final cleaned = clean(input);

    if (cleaned.length <= maxLength) {
      return cleaned;
    }

    return cleaned.substring(0, maxLength);
  }

  static String cleanFileName(String fileName) {
    return fileName.replaceAll(
      RegExp(r'[/\\:*?"<>|]'),
      '_',
    );
  }
}
