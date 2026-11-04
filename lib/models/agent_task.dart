enum AgentTaskStatus {
  pending,
  running,
  waitingForApproval,
  completed,
  failed,
  cancelled,
}

class AgentTask {
  final String id;
  final String title;
  final String description;
  final AgentTaskStatus status;
  final DateTime createdAt;
  final DateTime? completedAt;
  final bool requiresApproval;

  const AgentTask({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    this.completedAt,
    this.requiresApproval = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'requiresApproval': requiresApproval,
    };
  }

  factory AgentTask.fromJson(Map<String, dynamic> json) {
    return AgentTask(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: AgentTaskStatus.values.firstWhere(
        (value) => value.name == json['status'],
        orElse: () => AgentTaskStatus.pending,
      ),
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(
              json['completedAt'] as String,
            ),
      requiresApproval:
          json['requiresApproval'] as bool? ?? true,
    );
  }
}
