class Note {
  final String title;
  final String description;

  Note({required this.title, required this.description});
}

class NotesMeneger {
  List<Note> _notes = [];

  addNote(Note note) {
    _notes.add(note);
  }

  removeAtNote(int index) {
    _notes.removeAt(index);
  }
}
