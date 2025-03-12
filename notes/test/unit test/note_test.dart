import 'package:flutter_test/flutter_test.dart';
import 'package:notes/Notes/add_note.dart';

void main() {
  group('Test notes manager', () {
    test('Test add note', () async {
      // Arange
      final notesMeneger = NotesMeneger();
      final title = 'Hello';
      final description = "I'm from Belarus";

      // Act
      notesMeneger.addNote("Hello", "I'm from Belarus");
      final notes = notesMeneger.notes;

      // Assert
      expect(notes[0].description, description);
      expect(notes[0].title, title);
      expect(notes.length, 1);
      expect(notes[0].id, isNotEmpty);
    });
    test('Test delete note', () {
      // Arrange
      final notesMeneger = NotesMeneger();

      // Act
      notesMeneger.addNote('Hello', "I'm from Belarus");
      final notes = notesMeneger.notes;
      expect(notes.length, 1);
      final idNote = notes[0].id;
      notesMeneger.deleteNote(idNote);

      // Assert
      expect(notes.length, 0);
      expect(notes, isEmpty);
    });

    test('Test update note', () {
      // Arrange
      final notesMeneger = NotesMeneger();

      // Act
      notesMeneger.addNote('Home', 'My house is big');
      final notes = notesMeneger.notes;
      expect(notes.length, 1);

      final title = 'Maxim';
      final description = notes[0].description;
      final idNote = notes[0].id;

      notesMeneger.updateNote(idNote, title, description);

      // Assert
      expect(notes[0].id, idNote);
      expect(notes[0].title, 'Maxim');
      expect(notes[0].description, 'My house is big');
      expect(notes, isNotEmpty);
      expect(notes.length, 1);
    });
  });
}
