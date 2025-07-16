import 'package:flutter/material.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_state.dart';
import 'package:notes/feauters/notes/presentation/pages/view_note/view_note_page.dart';

class GridViewNotes extends StatelessWidget {
  final NotesState notesState;
  const GridViewNotes({super.key, required this.notesState});

  @override
  Widget build(BuildContext context) {
    if (notesState is InitialNotesState || notesState is LoadingNotesState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (notesState is LoadedNotesState) {
      final loadedState = notesState as LoadedNotesState;
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 1,
        ),
        itemCount: loadedState.notes.length,
        itemBuilder: (context, index) {
          return NoteContainer(
            state: notesState,
            note: loadedState.notes[index],
          );
        },
      );
    } else if (notesState is ErrorNotesState) {
      return Center(
        child: Text((notesState as ErrorNotesState).error),
      );
    } else {
      return Center(
        child: Text('Ошибка приложения'),
      );
    }
  }
}

class NoteContainer extends StatelessWidget {
  final NotesState state;
  final Note note;
  const NoteContainer({
    super.key,
    required this.note,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewNotePage(
                      note: note,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.surfaceColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                note.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                maxLines: 3,
                note.description,
                style: TextStyle(color: AppColors.descriptionColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
