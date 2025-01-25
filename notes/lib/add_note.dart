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

  void updateNote(String id, String newTitle, String newDescription) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = Note(
        title: newTitle,
        description: newDescription,
        id: id,
      );
    }
  }

  List<Note> get notes => _notes;
}
