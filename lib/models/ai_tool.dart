enum AiToolStatus {
  available,
  requiresPermission,
  unavailable,
}

class AiTool {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final AiToolStatus status;
  final bool requiresConfirmation;

  const AiTool({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    this.status = AiToolStatus.available,
    this.requiresConfirmation = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconName': iconName,
      'status': status.name,
      'requiresConfirmation': requiresConfirmation,
    };
  }

  factory AiTool.fromJson(Map<String, dynamic> json) {
    return AiTool(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      status: AiToolStatus.values.firstWhere(
        (value) => value.name == json['status'],
        orElse: () => AiToolStatus.unavailable,
      ),
      requiresConfirmation:
          json['requiresConfirmation'] as bool? ?? false,
    );
  }
}
