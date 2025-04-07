import 'package:notes/feauters/tasks/data/model/task_model.dart';
import 'package:notes/feauters/tasks/data/sources/local_data_cources.dart';
import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final LocalDataCources localDataCources;

  TaskRepositoryImpl(this.localDataCources);

  @override
  Future<List<Task>> getTasks() async {
    final List<TaskModel> tasks = await localDataCources.getTasks();
    return tasks
        .map((e) => Task(text: e.text, flag: e.flag, id: e.id))
        .toList();
  }

  @override
  Future<void> saveTasks(List<Task> tasks) async {
    final List<TaskModel> taskList =
        tasks.map((e) => TaskModel(e.id, e.text, e.flag)).toList();
    localDataCources.saveTasks(taskList);
  }
}
