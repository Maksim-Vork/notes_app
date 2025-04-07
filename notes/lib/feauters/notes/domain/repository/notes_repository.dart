import 'package:notes/feauters/notes/domain/entity/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<void> saveNotes(List<Note> notes);
}
