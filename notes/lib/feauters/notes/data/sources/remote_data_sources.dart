import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/feauters/notes/data/models/note_model.dart';

String _getCurrentUserId() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('Пользователь не авторизован!');
  }
  return user.uid;
}

class RemoteDataSources {
  Future<void> addNote(NoteModel note) async {
    final userId = _getCurrentUserId();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(note.id)
        .set(note.toMap());
  }

  Future<List<NoteModel>> getNotes() async {
    final userId = _getCurrentUserId();
    final QuerySnapshot notesFirestore = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notes')
        .get();
    final List<NoteModel> notes = notesFirestore.docs
        .map((noteMap) => NoteModel.fromMap(
            noteMap.data() as Map<String, dynamic>, noteMap.id))
        .toList();
    return notes;
  }

  Future<void> deleteNote(String id) async {
    final userId = _getCurrentUserId();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(id)
        .delete();
  }

  Future<void> updateNote(String id, NoteModel noteModel) async {
    final userId = _getCurrentUserId();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(id)
        .update(noteModel.toMap());
  }
}
