import 'package:flutter/material.dart';
import 'package:notes/add_note.dart';

class NotesServis extends StatefulWidget {
  final NotesMeneger notesMeneger;
  const NotesServis({super.key, required this.notesMeneger});

  @override
  State<NotesServis> createState() => _NotesServisState();
}

class _NotesServisState extends State<NotesServis> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDiscription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 56, 56),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 53, 48, 48),
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                color: Colors.white,
                iconSize: 25,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  widget.notesMeneger.addNote(
                      _controllerTitle.text, _controllerDiscription.text);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check))
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(21),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Заголовок',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 120, 120, 120), fontSize: 25)),
              cursorColor: Color.fromARGB(255, 255, 194, 25),
              cursorHeight: 23,
              controller: _controllerTitle,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
                style: TextStyle(
                    color: Color.fromARGB(255, 171, 168, 168), fontSize: 15),
                '20 янаваря 11:31'),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _controllerDiscription,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Начните ввод',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 120, 120, 120), fontSize: 18)),
              cursorColor: Color.fromARGB(255, 255, 194, 25),
              cursorHeight: 17,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
