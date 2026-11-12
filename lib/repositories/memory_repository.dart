import '../models/user_memory.dart';

class MemoryRepository {
  final List<UserMemory> _memories = [];

  Future<void> save(UserMemory memory) async {
    if (!memory.userApproved) {
      throw StateError('User approval is required.');
    }

    _memories.removeWhere((item) => item.id == memory.id);
    _memories.add(memory);
  }

  Future<List<UserMemory>> getAll() async {
    return List.unmodifiable(_memories);
  }

  Future<void> delete(String id) async {
    _memories.removeWhere((item) => item.id == id);
  }

  Future<void> clear() async {
    _memories.clear();
  }
}
