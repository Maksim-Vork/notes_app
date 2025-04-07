import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/domain/usecase/get_tasks_usecase.dart';
import 'package:notes/feauters/tasks/domain/usecase/save_task_usecase.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_event.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetTasksUsecase getTasksUsecase;
  final SaveTaskUsecase saveTaskUsecase;
  TasksBloc(this.getTasksUsecase, this.saveTaskUsecase)
      : super(TasksState([])) {
    _loadTasks();
    on<AddTaskEvent>(_onAdd);
    on<DeleteTaskEvent>(_onDelete);
    on<ToggleTaskCompletedEvent>(_onUpdate);
  }

  void _onAdd(AddTaskEvent event, Emitter<TasksState> emit) {
    final List<Task> updatedList = List<Task>.from(state.taskList)
      ..add(event.task);
    saveTaskUsecase(updatedList);
    emit(TasksState(updatedList));
  }

  void _onDelete(DeleteTaskEvent event, Emitter<TasksState> emit) {
    final List<Task> updatedList = List<Task>.from(state.taskList)
      ..removeWhere((e) => event.id == e.id);
    saveTaskUsecase(updatedList);
    emit(TasksState(updatedList));
  }

  void _onUpdate(ToggleTaskCompletedEvent event, Emitter<TasksState> emit) {
    final updatedTask = event.task.copyWith(flag: !event.task.flag);

    final updatedList = state.taskList.map((task) {
      return task.id == updatedTask.id ? updatedTask : task;
    }).toList();
    saveTaskUsecase(updatedList);
    emit(state.copyWith(taskList: updatedList));
  }

  void _loadTasks() async {
    final List<Task> loadedTasks = await getTasksUsecase();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(TasksState(loadedTasks));
  }
}
