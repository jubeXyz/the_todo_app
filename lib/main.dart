import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Todo> todos = [
    Todo(id: 0, topic: "Frühstücken", isDone: true),
    Todo(id: 1, topic: "Clojure lernen"),
    Todo(id: 2, topic: "Vorlesung vorbereiten", isDone: true),
    Todo(id: 3, topic: "Tasksheet vorbereiten", isDone: true),
    Todo(id: 4, topic: "Lego bauen"),
  ];

  List<Todo> get openTodos {
    final openTodos = <Todo>[];
    for (final todo in todos) {
      if (!todo.isDone) {
        openTodos.add(todo);
      }
    }
    return openTodos;
  }

  List<Todo> get doneTodos {
    final doneTodos = <Todo>[];
    for (final todo in todos) {
      if (todo.isDone) {
        doneTodos.add(todo);
      }
    }
    return doneTodos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoMainScreen(
        openTodos: openTodos,
        doneTodos: doneTodos,
        todos: todos,
      ), // Scaffold
    ); // MaterialApp
  }
}
