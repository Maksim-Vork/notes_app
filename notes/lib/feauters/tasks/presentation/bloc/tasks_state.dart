import 'package:notes/feauters/tasks/domain/entity/task.dart';

class TasksState {
  final List<Task> taskList;

  TasksState(this.taskList);

  TasksState copyWith({List<Task>? taskList}) {
    return TasksState(taskList ?? this.taskList);
  }
}
