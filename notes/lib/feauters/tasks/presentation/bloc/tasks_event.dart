import 'package:notes/feauters/tasks/domain/entity/task.dart';

abstract class TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final Task task;

  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends TasksEvent {
  final String id;

  DeleteTaskEvent(this.id);
}

class ToggleTaskCompletedEvent extends TasksEvent {
  final Task task;

  ToggleTaskCompletedEvent(this.task);
}
