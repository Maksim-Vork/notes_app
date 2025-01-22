import 'package:notes/add_note.dart';
import 'package:flutter/material.dart';

class NoteDescription extends StatefulWidget {
  final Note note;
  const NoteDescription({super.key, required this.note});

  @override
  State<NoteDescription> createState() => _NoteDescriptionState();
}

class _NoteDescriptionState extends State<NoteDescription> {
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
                onPressed: () {},
                icon: Icon(Icons.delete))
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(21),
        child: ListView(
          children: [
            Text(
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                ),
                widget.note.title),
            Text(
                style: TextStyle(
                    color: Color.fromARGB(255, 171, 168, 168), fontSize: 15),
                '20 янаваря 11:31'),
            SizedBox(
              height: 15,
            ),
            Text(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                widget.note.description),
          ],
        ),
      ),
    );
  }
}
