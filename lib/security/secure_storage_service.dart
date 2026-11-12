class SecureStorageService {
  // Temporary storage only.
  // Later this will use Android encrypted storage.

  final Map<String, String> _temporaryStorage = {};

  Future<void> save({
    required String key,
    required String value,
  }) async {
    if (key.trim().isEmpty || value.isEmpty) {
      throw ArgumentError('Key and value are required.');
    }

    _temporaryStorage[key] = value;
  }

  Future<String?> read(String key) async {
    return _temporaryStorage[key];
  }

  Future<void> delete(String key) async {
    _temporaryStorage.remove(key);
  }

  Future<void> clear() async {
    _temporaryStorage.clear();
  }
}
