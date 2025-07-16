import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class AddNoteUsecase {
  final NotesRepository repository;

  AddNoteUsecase({required this.repository});

  Future<void> call(Note note) async {
    await repository.addNote(note);
  }
}
