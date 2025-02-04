import 'package:flutter_test/flutter_test.dart';
import 'package:notes/Task/add_task.dart';

void main() {
  group('Тест такск мендежера', () {
    late TaskManager taskManager;

    setUp(() {
      taskManager = TaskManager();
    });
    test('Добавление задачи', () {
      taskManager.addTask('Написать тесты');
      expect(taskManager.TaskList[0].title, 'Написать тесты');
    });
    test('Удаление задачи', () {
      taskManager.addTask('Написать тесты');
      final taskId = taskManager.TaskList[0].id;

      taskManager.deleteTask(taskId);
      expect(taskManager.TaskList, isEmpty);
    });
  });
}
