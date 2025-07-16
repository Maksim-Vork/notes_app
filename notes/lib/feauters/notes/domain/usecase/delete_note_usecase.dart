import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class DeleteNoteUsecase {
  final NotesRepository repository;

  DeleteNoteUsecase({required this.repository});

  Future<void> call(String id) async {
    await repository.deleteNote(id);
  }
}
