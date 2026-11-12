import '../models/agent_task.dart';

class TaskPlanner {
  AgentTask createTask({
    required String title,
    required String description,
    bool requiresApproval = true,
  }) {
    final now = DateTime.now();

    return AgentTask(
      id: now.microsecondsSinceEpoch.toString(),
      title: title,
      description: description,
      status: requiresApproval
          ? AgentTaskStatus.waitingForApproval
          : AgentTaskStatus.pending,
      createdAt: now,
      completedAt: null,
      requiresApproval: requiresApproval,
    );
  }

  List<String> createSteps(String description) {
    if (description.trim().isEmpty) {
      return [];
    }

    return [
      'Understand the requested task',
      'Check required tools and permissions',
      'Prepare an execution plan',
      'Execute approved actions',
      'Verify the result',
    ];
  }
}
