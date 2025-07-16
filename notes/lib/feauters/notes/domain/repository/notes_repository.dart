import 'package:notes/feauters/notes/domain/entity/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> updateNote(String id, Note note);
}
