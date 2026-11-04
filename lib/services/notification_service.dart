class NotificationService {
  bool isInitialized = false;

  Future<void> initialize() async {
    // Notification package will be connected later.
    isInitialized = true;
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    if (!isInitialized) {
      throw StateError(
        'Initialize notification service first.',
      );
    }

    throw UnimplementedError(
      'Android notifications will be added later.',
    );
  }

  Future<void> cancelAll() async {
    // Cancel notification implementation will be added.
  }
}
