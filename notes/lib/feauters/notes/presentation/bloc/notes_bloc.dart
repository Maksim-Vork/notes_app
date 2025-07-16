import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/usecase/add_note_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/delete_note_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/get_notes_usecase.dart';
import 'package:notes/feauters/notes/domain/usecase/update_note_usecase.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_event.dart';
import 'package:notes/feauters/notes/presentation/bloc/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final AddNoteUsecase addNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;
  final GetNotesUsecase getNotesUsecase;
  final UpdateNoteUsecase updateNoteUsecase;

  NotesBloc(this.addNoteUsecase, this.deleteNoteUsecase, this.getNotesUsecase,
      this.updateNoteUsecase)
      : super(InitialNotesState()) {
    on<GetNotesEvent>(_onGetNotes);
    on<NoteAddEvent>(_onAdd);
    on<NoteDeleteEvent>(_onDelete);
    on<NoteUpdateEvent>(_onUpdate);
  }

  void _onGetNotes(GetNotesEvent event, Emitter<NotesState> emit) async {
    emit(LoadingNotesState());
    try {
      final List<Note> notes = await getNotesUsecase();
      emit(LoadedNotesState(notes: notes));
    } catch (e) {
      emit(ErrorNotesState(error: e.toString()));
    }
  }

  void _onAdd(NoteAddEvent event, Emitter<NotesState> emit) async {
    try {
      await addNoteUsecase(event.note);
      final List<Note> notes = await getNotesUsecase();
      emit(LoadedNotesState(notes: notes));
    } catch (e) {
      emit(ErrorNotesState(error: e.toString()));
    }
  }

  void _onDelete(NoteDeleteEvent event, Emitter<NotesState> emit) async {
    try {
      await deleteNoteUsecase(event.id);
      final List<Note> notes = await getNotesUsecase();
      emit(LoadedNotesState(notes: notes));
    } catch (e) {
      emit(ErrorNotesState(error: e.toString()));
    }
  }

  void _onUpdate(NoteUpdateEvent event, Emitter<NotesState> emit) async {
    try {
      await updateNoteUsecase(event.note);
      final List<Note> notes = await getNotesUsecase();
      emit(LoadedNotesState(notes: notes));
    } catch (e) {
      emit(ErrorNotesState(error: e.toString()));
    }
  }
}
