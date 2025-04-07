import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Task {
  final String id;
  final String text;
  final bool flag;

  Task({
    String? id,
    required this.text,
    this.flag = false,
  }) : id = id ?? _uuid.v4();

  Task copyWith({
    String? id,
    String? text,
    bool? flag,
  }) {
    return Task(
      id: id ?? this.id,
      text: text ?? this.text,
      flag: flag ?? this.flag,
    );
  }
}
