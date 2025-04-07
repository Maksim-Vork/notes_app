import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Note {
  final String id;
  final String title;
  final String description;
  final DateTime timeCreated;

  Note({
    String? id,
    required this.title,
    required this.description,
    required this.timeCreated,
  }) : id = id ?? uuid.v4();
}
