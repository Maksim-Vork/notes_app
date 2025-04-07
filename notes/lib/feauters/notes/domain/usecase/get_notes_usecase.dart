import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class GetNotesUsecase {
  final NotesRepository repository;

  GetNotesUsecase(this.repository);

  Future<List<Note>> call() async {
    return await repository.getNotes();
  }
}
