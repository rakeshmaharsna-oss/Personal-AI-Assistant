import '../models/attachment.dart';

class FileService {
  final List<Attachment> _attachments = [];

  List<Attachment> get attachments =>
      List.unmodifiable(_attachments);

  Future<void> addAttachment(
    Attachment attachment,
  ) async {
    _attachments.removeWhere(
      (item) => item.id == attachment.id,
    );

    _attachments.add(attachment);
  }

  Future<List<Attachment>> getAttachments() async {
    return List.unmodifiable(_attachments);
  }

  Future<void> deleteAttachment(String id) async {
    _attachments.removeWhere(
      (item) => item.id == id,
    );
  }

  Future<void> clearAttachments() async {
    _attachments.clear();
  }
}
