class ActionApproval {
  final Set<String> _pendingApprovals = {};
  final Set<String> _approvedTasks = {};
  final Set<String> _rejectedTasks = {};

  void requestApproval(String taskId) {
    _pendingApprovals.add(taskId);
  }

  bool approve(String taskId) {
    if (!_pendingApprovals.contains(taskId)) {
      return false;
    }

    _pendingApprovals.remove(taskId);
    _approvedTasks.add(taskId);

    return true;
  }

  bool reject(String taskId) {
    if (!_pendingApprovals.contains(taskId)) {
      return false;
    }

    _pendingApprovals.remove(taskId);
    _rejectedTasks.add(taskId);

    return true;
  }

  bool isApproved(String taskId) {
    return _approvedTasks.contains(taskId);
  }

  bool isPending(String taskId) {
    return _pendingApprovals.contains(taskId);
  }

  bool isRejected(String taskId) {
    return _rejectedTasks.contains(taskId);
  }
}
