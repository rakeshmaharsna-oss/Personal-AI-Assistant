import '../models/agent_task.dart';

class TaskExecutor {
  Future<AgentTask> execute(AgentTask task) async {
    if (task.requiresApproval &&
        task.status != AgentTaskStatus.waitingForApproval) {
      throw StateError('Task approval is required.');
    }

    if (task.status == AgentTaskStatus.waitingForApproval) {
      throw StateError('Task must be approved first.');
    }

    final completedTask = AgentTask(
      id: task.id,
      title: task.title,
      description: task.description,
      status: AgentTaskStatus.completed,
      createdAt: task.createdAt,
      completedAt: DateTime.now(),
      requiresApproval: task.requiresApproval,
    );

    return completedTask;
  }
}
