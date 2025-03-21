// ignore: file_names
import 'package:flutter/material.dart';
import 'package:notes/Task/TaskDescription.dart';
import 'package:notes/Task/task_servis.dart';
import 'package:notes/Task/add_task.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 48, 48),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                    color: Color.fromARGB(0, 194, 194, 194),
                    Icons.create_new_folder)),
            Text(
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                'Задачи'),
            IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                    color: Color.fromARGB(255, 194, 194, 194), Icons.settings)),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 11, horizontal: 9),
          child: Consumer<TaskManager>(builder: (context, taskManager, child) {
            return ListView.builder(
              itemCount: taskManager.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                final task = taskManager.taskList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskDescription(
                                    task: task,
                                  )));
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 87, 80, 80),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                              task.title),
                          leading: Checkbox(
                            activeColor: Color.fromARGB(255, 255, 194, 25),
                            checkColor: Colors.white,
                            side: BorderSide(color: Colors.white),
                            value: task.isDone,
                            onChanged: (bool? value) {
                              setState(() {
                                taskManager.toggleTask(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          })),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 194, 25),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TasksServis(),
            ),
          );
        },
        child: Icon(
          size: 30,
          color: Colors.white,
          Icons.add,
        ),
      ),
    );
  }
}
