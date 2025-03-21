// ignore: file_names
import 'package:flutter/material.dart';
import 'package:notes/Task/add_task.dart';
import 'package:provider/provider.dart';

class TaskDescription extends StatefulWidget {
  final Task task;

  const TaskDescription({
    super.key,
    required this.task,
  });

  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.task.title;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveTask() {
    context
        .read<TaskManager>()
        .updateTask(widget.task.id, _titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 53, 48, 48),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Colors.white,
              iconSize: 25,
              onPressed: () {
                _saveTask();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                context.read<TaskManager>().deleteTask(widget.task.id);

                Navigator.pop(context);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(21),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Введите заголовок задачи',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Text(
              style: TextStyle(
                color: Color.fromARGB(255, 171, 168, 168),
                fontSize: 15,
              ),
              '20 января 11:31',
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
