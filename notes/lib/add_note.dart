class Note {
  final String title;
  final String description;

  Note({required this.title, required this.description});
}

class NotesMeneger {
  final List<Note> _notes = [
    Note(title: 'Title', description: 'Am Am'),
  ];

  addNote(Note note) {
    _notes.add(note);
  }

  removeAtNote(int index) {
    _notes.removeAt(index);
  }

  List<Note> getNotes() {
    return _notes;
  }
}
