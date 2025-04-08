import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

class DescriptionFieldView extends StatelessWidget {
  final TextEditingController descriptionControllerView;
  const DescriptionFieldView(
      {super.key, required this.descriptionControllerView});

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
            color: AppColors.descriptionColor,
            fontSize: 18,
            fontWeight: FontWeight.w300),
      ),
      controller: descriptionControllerView,
    );
  }
}
