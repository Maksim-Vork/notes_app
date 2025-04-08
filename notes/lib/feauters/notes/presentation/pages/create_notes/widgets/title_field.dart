import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

class TitleFieldCreated extends StatelessWidget {
  final TextEditingController titleController;
  const TitleFieldCreated({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Заголовок',
        hintStyle: TextStyle(
            color: AppColors.searchColor,
            fontSize: 25,
            fontWeight: FontWeight.w500),
      ),
      controller: titleController,
    );
  }
}
