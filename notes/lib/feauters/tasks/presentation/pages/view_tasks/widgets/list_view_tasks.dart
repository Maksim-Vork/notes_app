import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/tasks/domain/entity/task.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_event.dart';
import 'package:notes/feauters/tasks/presentation/bloc/tasks_state.dart';

class ListViewTasks extends StatelessWidget {
  final TasksState state;
  const ListViewTasks({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.taskList.length,
        itemBuilder: (context, index) {
          return TaskView(
            task: state.taskList[index],
          );
        });
  }
}

// ignore: must_be_immutable
class TaskView extends StatefulWidget {
  final Task task;
  const TaskView({
    super.key,
    required this.task,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 87, 80, 80),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.amber,
                    value: widget.task.flag,
                    onChanged: (bool? newValue) {
                      BlocProvider.of<TasksBloc>(context)
                          .add(ToggleTaskCompletedEvent(widget.task));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.task.text,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<TasksBloc>(context)
                      .add(DeleteTaskEvent(widget.task.id));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
