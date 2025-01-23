class Note {
  final String title;
  final String description;
  final String id;

  Note({required this.title, required this.description, required this.id});
}

class NotesMeneger {
  final List<Note> _notes = [];

  void addNote(String title, String description) {
    final newNote = Note(
        title: title, description: description, id: DateTime.now().toString());
    _notes.add(newNote);
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
  }

  List<Note> get notes => _notes;
}
