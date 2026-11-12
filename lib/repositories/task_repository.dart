import '../models/agent_task.dart';

class TaskRepository {
  final List<AgentTask> _tasks = [];

  Future<void> saveTask(AgentTask task) async {
    _tasks.removeWhere((item) => item.id == task.id);
    _tasks.add(task);
  }

  Future<List<AgentTask>> getAllTasks() async {
    return List.unmodifiable(_tasks);
  }

  Future<AgentTask?> getTask(String id) async {
    for (final task in _tasks) {
      if (task.id == id) return task;
    }

    return null;
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((item) => item.id == id);
  }

  Future<void> clearTasks() async {
    _tasks.clear();
  }
}
