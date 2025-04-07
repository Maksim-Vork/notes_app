import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/usecase/get_notes_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/save_note_usecase.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_event.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUsecase getNotes;
  final SaveNoteUsecase saveNote;
  NotesBloc(this.getNotes, this.saveNote) : super(NotesState([])) {
    _loadNotes();
    on<NoteAdd>(_onAdd);
    on<NoteDelete>(_onDelete);
    on<NoteUpdate>(_onUpdated);
  }
  void _onAdd(NoteAdd event, Emitter<NotesState> emit) {
    final List<Note> updatedList = List<Note>.from(state.noteList)
      ..add(event.note);
    emit(NotesState(updatedList));
  }

  void _onDelete(NoteDelete event, Emitter<NotesState> emit) {
    final List<Note> updateList = List<Note>.from(state.noteList)
      ..removeWhere((note) => event.id == note.id);

    saveNote(updateList);
    emit(NotesState(updateList));
  }

  void _onUpdated(NoteUpdate event, Emitter<NotesState> emit) {
    final updatedList = state.noteList.map((note) {
      if (note.id == event.note.id) {
        return Note(
          id: note.id,
          title: event.note.title,
          description: event.note.description,
          timeCreated: note.timeCreated,
        );
      }
      return note;
    }).toList();

    saveNote(updatedList);
    emit(NotesState(updatedList));
  }

  void _loadNotes() async {
    final loadedNotes = await getNotes();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(NotesState(loadedNotes));
  }
}
