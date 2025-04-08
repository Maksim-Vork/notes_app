import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_bloc.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_event.dart';

class AppBarNotesCreate extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final DateTime timeCreated;

  const AppBarNotesCreate({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.timeCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: AppColors.descriptionColor,
            )),
        IconButton(
            onPressed: () {
              final title = titleController.text;
              final description = descriptionController.text;

              if (title.isNotEmpty) {
                BlocProvider.of<NotesBloc>(context).add(
                  NoteAdd(
                    Note(
                      title: title,
                      description: description,
                      timeCreated: timeCreated,
                    ),
                  ),
                );
              }

              Navigator.pop(context);
            },
            icon: Icon(
              Icons.check,
              size: 35,
              color: AppColors.descriptionColor,
            )),
      ],
    );
  }
}
