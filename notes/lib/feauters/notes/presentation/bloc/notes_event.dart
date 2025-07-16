import 'package:notes/feauters/notes/domain/entity/note.dart';

abstract class NotesEvent {}

class GetNotesEvent extends NotesEvent {}

class NoteAddEvent extends NotesEvent {
  final Note note;

  NoteAddEvent(this.note);
}

class NoteDeleteEvent extends NotesEvent {
  final String id;

  NoteDeleteEvent(this.id);
}

class NoteUpdateEvent extends NotesEvent {
  final Note note;

  NoteUpdateEvent(this.note);
}
