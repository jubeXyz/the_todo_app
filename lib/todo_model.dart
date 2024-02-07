import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(id: 0, topic: "Frühstücken"),
    Todo(id: 1, topic: "Clojure lernen"),
    Todo(id: 2, topic: "Vorlesung vorbereiten"),
    Todo(id: 3, topic: "Tasksheet vorbereiten"),
    Todo(id: 4, topic: "Lego bauen"),
  ];

  List<Todo> get todos => _todos;

  void updateTodoStatus(int index, bool isDone) {
    _todos[index].isDone = isDone;
    notifyListeners();
  }

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
}
