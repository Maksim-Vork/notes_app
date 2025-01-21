import 'package:flutter/material.dart';

class NotesServis extends StatefulWidget {
  const NotesServis({super.key});

  @override
  State<NotesServis> createState() => _NotesServisState();
}

class _NotesServisState extends State<NotesServis> {
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
                icon: Icon(Icons.check))
          ],
        ),
      ),
    );
  }
}
