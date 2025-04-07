import 'package:notes/feauters/notes/domain/entity/note.dart';

abstract class NotesEvent {}

class NoteAdd extends NotesEvent {
  final Note note;

  NoteAdd(this.note);
}

class NoteDelete extends NotesEvent {
  final String id;

  NoteDelete(this.id);
}

class NoteUpdate extends NotesEvent {
  final Note note;

  NoteUpdate(this.note);
}
