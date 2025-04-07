import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_state.dart';
import 'package:notes/feauters/tasks/presentation/pages/create_task/create_task_page.dart';
import 'package:notes/feauters/tasks/presentation/pages/view_tasks/widgets/app_bar_task_view.dart';
import 'package:notes/feauters/tasks/presentation/pages/view_tasks/widgets/list_view_tasks.dart';
import 'package:notes/feauters/tasks/presentation/pages/view_tasks/widgets/search_container_tasks.dart';

class ViewTasksPage extends StatelessWidget {
  ViewTasksPage({super.key});
  final TextEditingController _findController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 194, 25),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTaskPage()));
          },
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 53, 48, 48),
          title: AppBarTaskView()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            SearchContainerTasks(findTaskController: _findController),
            SizedBox(height: 20),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListViewTasks(
                  state: state,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
