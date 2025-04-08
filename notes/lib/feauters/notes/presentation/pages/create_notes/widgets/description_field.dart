import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

class DescriptionFieldCreated extends StatelessWidget {
  final TextEditingController descriptionController;
  const DescriptionFieldCreated(
      {super.key, required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Начните ввод',
        hintStyle: TextStyle(
            color: AppColors.titileFieldView,
            fontSize: 18,
            fontWeight: FontWeight.w300),
      ),
      controller: descriptionController,
    );
  }
}
