import '../models/ai_tool.dart';

class ToolRegistry {
  final Map<String, AiTool> _tools = {};

  void registerTool(AiTool tool) {
    _tools[tool.id] = tool;
  }

  AiTool? getTool(String id) {
    return _tools[id];
  }

  List<AiTool> getAllTools() {
    return List.unmodifiable(_tools.values);
  }

  List<AiTool> getAvailableTools() {
    return _tools.values
        .where(
          (tool) => tool.status == AiToolStatus.available,
        )
        .toList();
  }

  void removeTool(String id) {
    _tools.remove(id);
  }

  bool containsTool(String id) {
    return _tools.containsKey(id);
  }
}
