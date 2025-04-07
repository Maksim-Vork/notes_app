import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/domain/repository/task_repository.dart';

class GetTasksUsecase {
  final TaskRepository repository;

  GetTasksUsecase(this.repository);

  Future<List<Task>> call() async {
    return repository.getTasks();
  }
}
