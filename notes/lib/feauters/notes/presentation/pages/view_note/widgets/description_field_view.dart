import 'package:flutter/material.dart';

class DescriptionFieldView extends StatelessWidget {
  final TextEditingController descriptionControllerView;
  const DescriptionFieldView(
      {super.key, required this.descriptionControllerView});

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
      controller: descriptionControllerView,
    );
  }
}
