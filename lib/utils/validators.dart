class AppValidators {
  static String? validateRequired(
    String? value, {
    String fieldName = 'यह फील्ड',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName जरूरी है।';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'ईमेल लिखें।';
    }

    final emailRegex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'सही ईमेल पता लिखें।';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'पासवर्ड कम से कम 8 अक्षर का होना चाहिए।';
    }

    return null;
  }

  static String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'मैसेज खाली नहीं हो सकता।';
    }

    return null;
  }
}
