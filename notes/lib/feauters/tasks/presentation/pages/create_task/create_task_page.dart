import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

import 'package:notes/feauters/tasks/presentation/pages/create_task/widgets/app_bar_tasks_create.dart';
import 'package:notes/feauters/tasks/presentation/pages/create_task/widgets/text_field_created.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({
    super.key,
  });
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarAndBottomColor,
        title: AppBarTasksCreate(
          textController: _textController,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCreated(
                textController: _textController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
