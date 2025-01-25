import 'package:flutter/material.dart';
import 'package:notes/NoteDescription.dart';
import 'package:notes/add_note.dart';
import 'package:notes/notes_servis.dart';
import 'package:notes/task_list_Screen.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});
  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
//текущий индекс
  int _currentIndex = 0;
//список экранов
  final List<Widget> _children = [NotesScreen(), TaskScreen()];
//метод для изменения индекса
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 194, 194, 194),
        backgroundColor: Color.fromARGB(255, 53, 48, 48),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Заметки'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Задачи'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NotesMeneger notesMeneger =
      NotesMeneger(); //экземпляр класса менеджера заметок
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
                    color: Color.fromARGB(255, 194, 194, 194),
                    Icons.create_new_folder)),
            Text(
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                'Заметки'),
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
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 9),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: notesMeneger.notes.length,
          itemBuilder: (context, index) {
            final note =
                notesMeneger.notes[index]; //получение заметки по индексу
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteDescription(
                              note: note,
                              notesMeneger: notesMeneger))).then((_) {
                    setState(() {});
                  });
                },
                child: Container(
                  height: 153,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 87, 80, 80),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                                note.title),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                maxLines: 3,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 194, 194, 194),
                                  fontSize: 15,
                                ),
                                note.description)
                          ])),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 194, 25),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NotesServis(notesMeneger: notesMeneger))).then((_) {
            setState(() {});
          });
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
