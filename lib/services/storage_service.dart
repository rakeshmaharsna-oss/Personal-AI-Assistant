class StorageService {
  final Map<String, dynamic> _data = {};

  Future<void> saveData(
    String key,
    dynamic value,
  ) async {
    _data[key] = value;
  }

  Future<dynamic> getData(String key) async {
    return _data[key];
  }

  Future<bool> containsKey(String key) async {
    return _data.containsKey(key);
  }

  Future<void> deleteData(String key) async {
    _data.remove(key);
  }

  Future<void> clearAll() async {
    _data.clear();
  }
}
