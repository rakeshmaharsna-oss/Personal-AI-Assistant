import 'package:flutter/foundation.dart';
import '../models/user_memory.dart';
import '../services/memory_service.dart';

class MemoryProvider extends ChangeNotifier {
  final MemoryService memoryService;

  MemoryProvider({required this.memoryService});

  List<UserMemory> _memories = [];

  List<UserMemory> get memories =>
      List.unmodifiable(_memories);

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadMemories() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _memories = await memoryService.getMemories();
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveMemory(UserMemory memory) async {
    try {
      await memoryService.saveMemory(memory);
      await loadMemories();
    } catch (error) {
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  Future<void> deleteMemory(String id) async {
    try {
      await memoryService.deleteMemory(id);
      await loadMemories();
    } catch (error) {
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  Future<void> clearAllMemories() async {
    try {
      await memoryService.clearMemories();
      _memories = [];
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
      notifyListeners();
    }
  }
}
