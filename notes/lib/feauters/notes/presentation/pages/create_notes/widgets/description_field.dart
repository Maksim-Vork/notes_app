import 'package:flutter/material.dart';

class DescriptionFieldCreated extends StatelessWidget {
  final TextEditingController descriptionController;
  const DescriptionFieldCreated(
      {super.key, required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 18,
          fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Начните ввод',
        hintStyle: TextStyle(
            color: Color.fromARGB(255, 120, 120, 120),
            fontSize: 18,
            fontWeight: FontWeight.w300),
      ),
      controller: descriptionController,
    );
  }
}
