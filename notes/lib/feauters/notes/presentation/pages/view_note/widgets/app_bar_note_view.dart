import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_bloc.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_event.dart';

class AppBarNoteView extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Note note;
  const AppBarNoteView({
    super.key,
    required this.note,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              final updatedNote = Note(
                id: note.id,
                title: titleController.text,
                description: descriptionController.text,
                timeCreated: DateTime.now(),
              );

              BlocProvider.of<NotesBloc>(context).add(NoteUpdate(updatedNote));
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Color.fromARGB(255, 194, 194, 194),
            )),
        IconButton(
            onPressed: () {
              BlocProvider.of<NotesBloc>(context).add(NoteDelete(note.id));
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              size: 35,
              color: Color.fromARGB(255, 194, 194, 194),
            )),
      ],
    );
  }
}
