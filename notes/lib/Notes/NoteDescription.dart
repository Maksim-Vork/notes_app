import 'package:notes/Notes/add_note.dart';
import 'package:flutter/material.dart';

class NoteDescription extends StatefulWidget {
  final Note note;
  final NotesMeneger notesMeneger;

  const NoteDescription(
      {super.key, required this.note, required this.notesMeneger});

  @override
  State<NoteDescription> createState() => _NoteDescriptionState();
}

class _NoteDescriptionState extends State<NoteDescription> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _descriptionController =
        TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
                widget.notesMeneger.updateNote(
                  widget.note.id,
                  _titleController.text,
                  _descriptionController.text,
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                widget.notesMeneger.deleteNote(widget.note.id);
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
                hintText: 'Введите заголовок',
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
            TextField(
              controller: _descriptionController,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Введите описание',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
