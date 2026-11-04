enum AttachmentType {
  image,
  video,
  document,
  audio,
  other,
}

class Attachment {
  final String id;
  final String name;
  final String localPath;
  final AttachmentType type;
  final String? mimeType;
  final int? sizeInBytes;
  final DateTime addedAt;

  const Attachment({
    required this.id,
    required this.name,
    required this.localPath,
    required this.type,
    required this.addedAt,
    this.mimeType,
    this.sizeInBytes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'localPath': localPath,
      'type': type.name,
      'mimeType': mimeType,
      'sizeInBytes': sizeInBytes,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] as String,
      name: json['name'] as String,
      localPath: json['localPath'] as String,
      type: AttachmentType.values.firstWhere(
        (value) => value.name == json['type'],
        orElse: () => AttachmentType.other,
      ),
      mimeType: json['mimeType'] as String?,
      sizeInBytes: json['sizeInBytes'] as int?,
      addedAt: DateTime.parse(
        json['addedAt'] as String,
      ),
    );
  }
}
