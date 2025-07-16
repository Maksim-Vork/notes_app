import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class UpdateNoteUsecase {
  final NotesRepository repository;

  UpdateNoteUsecase({required this.repository});

  Future<void> call(Note note) async {
    await repository.updateNote(note.id, note);
  }
}
