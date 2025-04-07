import 'package:flutter/material.dart';

class AppBarNotesView extends StatelessWidget {
  const AppBarNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.create_new_folder,
              size: 35,
              color: Color.fromARGB(255, 194, 194, 194),
            )),
        Text(
          'Заметки',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 35,
              color: Color.fromARGB(255, 194, 194, 194),
            )),
      ],
    );
  }
}
