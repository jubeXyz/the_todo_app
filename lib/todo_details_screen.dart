import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_model.dart';

class TodoDetailsScreen extends StatefulWidget {
  const TodoDetailsScreen({
    super.key,
    required this.todo,
    required this.statusCheck,
  });

  final Todo todo;
  final void Function(bool) statusCheck;

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.topic),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Text(
              "ID: ${widget.todo.id}",
              style: const TextStyle(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Erledigt?",
                  style: TextStyle(fontSize: 24),
                ),
                Checkbox(
                    value: widget.todo.isDone,
                    onChanged: (newValue) {
                      setState(() {
                        widget.statusCheck(newValue!);
                      });
                    }),
              ],
            ),
            Text(
              "Aktuell noch offene Todos: ${openTodos.length.toString()}",
            ),
            Text(
              "Insgesamt erledigte Todos: ${doneTodos.length.toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
