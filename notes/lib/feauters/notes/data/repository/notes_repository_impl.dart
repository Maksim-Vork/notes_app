import 'package:notes/feauters/notes/data/models/note_model.dart';
import 'package:notes/feauters/notes/data/sources/remote_data_sources.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class NotesRepositoryImpl extends NotesRepository {
  final RemoteDataSources remoteDataSources;

  NotesRepositoryImpl(this.remoteDataSources);
  @override
  Future<List<Note>> getNotes() async {
    final List<NoteModel> notesList = await remoteDataSources.getNotes();
    return notesList
        .map((e) => Note(
            id: e.id,
            title: e.title,
            description: e.description,
            timeCreated: e.timeCreated))
        .toList();
  }

  @override
  Future<void> addNote(Note note) async {
    final NoteModel noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
        timeCreated: note.timeCreated);
    await remoteDataSources.addNote(noteModel);
  }

  @override
  Future<void> deleteNote(String id) async {
    await remoteDataSources.deleteNote(id);
  }

  @override
  Future<void> updateNote(String id, Note note) async {
    final NoteModel noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
        timeCreated: note.timeCreated);
    await remoteDataSources.updateNote(id, noteModel);
  }
}
