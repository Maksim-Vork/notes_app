class TaskModel {
  final String id;
  final String text;
  final bool flag;

  TaskModel(this.id, this.text, this.flag);

  // Сериализация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'flag': flag,
    };
  }

  // Десериализация из JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      json['id'] as String,
      json['text'] as String,
      json['flag'] as bool,
    );
  }
}
