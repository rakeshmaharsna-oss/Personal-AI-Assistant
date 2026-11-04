enum MemoryCategory {
  personal,
  preference,
  project,
  other,
}

class UserMemory {
  final String id;
  final String title;
  final String content;
  final MemoryCategory category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool userApproved;

  const UserMemory({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.userApproved = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'userApproved': userApproved,
    };
  }

  factory UserMemory.fromJson(Map<String, dynamic> json) {
    return UserMemory(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: MemoryCategory.values.firstWhere(
        (value) => value.name == json['category'],
        orElse: () => MemoryCategory.other,
      ),
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String,
      ),
      userApproved: json['userApproved'] as bool? ?? false,
    );
  }
}
