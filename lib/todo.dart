class Todo {
  Todo({
    required this.id,
    required this.topic,
    this.isDone = false,
  });

  final int id;
  final String topic;
  bool isDone;
}
