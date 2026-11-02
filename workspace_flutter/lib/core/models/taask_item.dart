enum TaskPriority { low, medium, high, urgent }

enum TaskStatus { pending, inProgress, completed, blocked, onHold, cancelled, review }

class TaskItem {
  final String taskId;
  final String title;
  final String description;
  final TaskPriority priority;
  final TaskStatus status;
  final DateTime dueDate;
  final String assigneeId;

  const TaskItem({
    required this.taskId,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.dueDate,
    required this.assigneeId,
  });
}
