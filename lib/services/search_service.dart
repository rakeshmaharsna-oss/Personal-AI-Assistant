class SearchService {
  bool get isAvailable => false;

  Future<List<Map<String, String>>> search(
    String query,
  ) async {
    if (query.trim().isEmpty) {
      return [];
    }

    throw UnimplementedError(
      'Web search API will be connected later.',
    );
  }
}
