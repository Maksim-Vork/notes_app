import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class NoteModel {
  final String id;
  final String title;
  final String description;
  final DateTime timeCreated;

  NoteModel({
    String? id,
    required this.title,
    required this.description,
    required this.timeCreated,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'timeCreated': Timestamp.fromDate(timeCreated),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map, String documentId) {
    return NoteModel(
      id: documentId,
      title: map['title'],
      description: map['description'],
      timeCreated: (map['timeCreated'] as Timestamp).toDate(),
    );
  }
}
