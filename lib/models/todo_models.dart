class TodoModel {
  final int id;
  final String content;
  final bool isCompleted;

  TodoModel({required this.id, required this.content, required this.isCompleted});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        content: json['content'],
        isCompleted: json['is_completed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'is_completed': isCompleted,
      };
}
