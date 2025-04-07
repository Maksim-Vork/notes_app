import 'dart:convert';

import 'package:notes/feauters/notes/data/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSources {
  final String _notesKay = 'notes';

  Future<List<NoteModel>> getNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> notesListJson = prefs.getStringList(_notesKay) ?? [];

    final List<NoteModel> notesList = notesListJson
        .map((noteJson) => NoteModel.fromJson(jsonDecode(noteJson)))
        .toList();
    return notesList;
  }

  Future<void> saveNotes(List<NoteModel> notes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> notesJsonList =
        notes.map((note) => jsonEncode(note.toJson())).toList();
    await prefs.setStringList(_notesKay, notesJsonList);
  }
}
