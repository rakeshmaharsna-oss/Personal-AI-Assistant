import '../models/agent_task.dart';
import 'task_planner.dart';
import 'task_executor.dart';
import 'action_approval.dart';

class AgentManager {
  final TaskPlanner planner;
  final TaskExecutor executor;
  final ActionApproval approval;

  AgentManager({
    required this.planner,
    required this.executor,
    required this.approval,
  });

  Future<AgentTask> createTask({
    required String title,
    required String description,
    bool requiresApproval = true,
  }) async {
    final task = planner.createTask(
      title: title,
      description: description,
      requiresApproval: requiresApproval,
    );

    if (task.requiresApproval) {
      approval.requestApproval(task.id);
      return task;
    }

    return executor.execute(task);
  }

  Future<AgentTask> approveTask(AgentTask task) async {
    approval.approve(task.id);
    return executor.execute(task);
  }

  void rejectTask(String taskId) {
    approval.reject(taskId);
  }
}
