import 'package:notes/feauters/notes/domain/entity/note.dart';

abstract class NotesState {}

class InitialNotesState extends NotesState {}

class LoadingNotesState extends NotesState {}

class LoadedNotesState extends NotesState {
  final List<Note> notes;

  LoadedNotesState({required this.notes});
}

class ErrorNotesState extends NotesState {
  final String error;

  ErrorNotesState({required this.error});
}
