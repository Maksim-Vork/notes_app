import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_event.dart';

class AppBarTasksCreate extends StatelessWidget {
  final TextEditingController textController;

  const AppBarTasksCreate({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: AppColors.descriptionColor,
            )),
        IconButton(
            onPressed: () {
              final text = textController.text;

              if (text.isNotEmpty) {
                BlocProvider.of<TasksBloc>(context)
                    .add(AddTaskEvent(Task(text: text)));
              }

              Navigator.pop(context);
            },
            icon: Icon(
              Icons.check,
              size: 35,
              color: AppColors.descriptionColor,
            )),
      ],
    );
  }
}
