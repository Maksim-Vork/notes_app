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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'timeCreated': timeCreated.toIso8601String(),
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      timeCreated: DateTime.parse(json['timeCreated']),
    );
  }
}
