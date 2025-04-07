import 'package:flutter/material.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_state.dart';
import 'package:notes/feauters/notes/presentation/pages/view_note/view_note_page.dart';

class GridViewNotes extends StatelessWidget {
  final NotesState state;
  const GridViewNotes({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13,
        childAspectRatio: 1,
      ),
      itemCount: state.noteList.length,
      itemBuilder: (context, index) {
        return NoteContainer(
          state: state,
          note: state.noteList[index],
        );
      },
    );
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
          color: Color.fromARGB(255, 87, 80, 80),
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
                style: TextStyle(color: Color.fromARGB(255, 194, 194, 194)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
