import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/domain/repository/task_repository.dart';

class SaveTaskUsecase {
  final TaskRepository repository;

  SaveTaskUsecase(this.repository);

  Future<void> call(List<Task> tasks) async {
    repository.saveTasks(tasks);
  }
}
