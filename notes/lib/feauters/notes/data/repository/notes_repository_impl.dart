import 'package:notes/feauters/notes/data/models/note_model.dart';
import 'package:notes/feauters/notes/data/sources/local_data_sources.dart';
import 'package:notes/feauters/notes/domain/entity/note.dart';
import 'package:notes/feauters/notes/domain/repository/notes_repository.dart';

class NotesRepositoryImpl extends NotesRepository {
  final LocalDataSources localDataSources;

  NotesRepositoryImpl(this.localDataSources);
  @override
  Future<List<Note>> getNotes() async {
    final List<NoteModel> notesList = await localDataSources.getNotes();
    return notesList
        .map((e) => Note(
            id: e.id,
            title: e.title,
            description: e.description,
            timeCreated: e.timeCreated))
        .toList();
  }

  @override
  Future<void> saveNotes(List<Note> notes) async {
    final List<NoteModel> notesList = notes
        .map((e) => NoteModel(
            id: e.id,
            title: e.title,
            description: e.description,
            timeCreated: e.timeCreated))
        .toList();
    await localDataSources.saveNotes(notesList);
  }
}
