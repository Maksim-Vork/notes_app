import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class SaveNoteUsecase {
  final NotesRepository repository;

  SaveNoteUsecase(this.repository);

  Future<void> call(List<Note> notes) async {
    repository.saveNotes(notes);
  }
}
