import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

class TitleFieldView extends StatelessWidget {
  final TextEditingController titleControllerView;
  const TitleFieldView({super.key, required this.titleControllerView});

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
            color: AppColors.titileFieldView,
            fontSize: 25,
            fontWeight: FontWeight.w500),
      ),
      controller: titleControllerView,
    );
  }
}
