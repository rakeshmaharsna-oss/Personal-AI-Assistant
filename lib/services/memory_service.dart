import '../models/user_memory.dart';

class MemoryService {
  final List<UserMemory> _memories = [];

  List<UserMemory> get memories =>
      List.unmodifiable(_memories);

  Future<void> saveMemory(UserMemory memory) async {
    if (!memory.userApproved) {
      throw StateError(
        'User approval is required to save memory.',
      );
    }

    _memories.removeWhere((item) => item.id == memory.id);
    _memories.add(memory);
  }

  Future<List<UserMemory>> getMemories() async {
    return List.unmodifiable(_memories);
  }

  Future<void> deleteMemory(String id) async {
    _memories.removeWhere((item) => item.id == id);
  }

  Future<void> clearMemories() async {
    _memories.clear();
  }
}
