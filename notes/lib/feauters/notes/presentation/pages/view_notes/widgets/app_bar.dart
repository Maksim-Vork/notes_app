import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';

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
              color: AppColors.descriptionColor,
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
              color: AppColors.descriptionColor,
            )),
      ],
    );
  }
}
