class AppHelpers {
  static String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');

    return '$day/$month/${date.year}';
  }

  static String formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static String cleanText(String text) {
    return text.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  static bool isEmpty(String text) {
    return text.trim().isEmpty;
  }

  static String capitalize(String text) {
    if (text.trim().isEmpty) return '';

    final value = text.trim();

    return value[0].toUpperCase() + value.substring(1);
  }
}
