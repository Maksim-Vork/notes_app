import 'package:flutter/material.dart';

class TitleFieldCreated extends StatelessWidget {
  final TextEditingController titleController;
  const TitleFieldCreated({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 25,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Заголовок',
        hintStyle: TextStyle(
            color: Color.fromARGB(255, 171, 168, 168),
            fontSize: 25,
            fontWeight: FontWeight.w500),
      ),
      controller: titleController,
    );
  }
}
