import 'package:the_todo_app/todo.dart';

final List<Todo> todos = [
  Todo(id: 0, topic: "Frühstücken"),
  Todo(id: 1, topic: "Clojure lernen"),
  Todo(id: 2, topic: "Vorlesung vorbereiten"),
  Todo(id: 3, topic: "Tasksheet vorbereiten"),
  Todo(id: 4, topic: "Lego bauen"),
];

List<Todo> get openTodos {
  var openTodos = <Todo>[];
  for (var todo in todos) {
    if (!todo.isDone) {
      openTodos.add(todo);
    }
  }
  return openTodos;
}

List<Todo> get doneTodos {
  var doneTodos = <Todo>[];
  for (var todo in todos) {
    if (todo.isDone) {
      doneTodos.add(todo);
    }
  }
  return doneTodos;
}

/*void updateStatus(int index, bool newStatus) {
  todos[index].isDone = newStatus;
}*/
