class ContextManager {
  final List<Map<String, String>> _history = [];

  List<Map<String, String>> get history =>
      List.unmodifiable(_history);

  void addMessage(String role, String content) {
    _history.add({
      'role': role,
      'content': content,
    });

    if (_history.length > 30) {
      _history.removeAt(0);
    }
  }

  void clear() {
    _history.clear();
  }

  int get messageCount => _history.length;
}
