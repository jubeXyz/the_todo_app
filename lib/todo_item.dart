import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_details_screen.dart';
import 'package:the_todo_app/todo_model.dart';

class TodoItem extends StatelessWidget {
  final int index;
  const TodoItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();
    final todo = todoProvider.todos[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailsScreen(
              todo: todo,
            ),
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (newValue) {
            todoProvider.updateTodoStatus(index, newValue ?? false);
          },
        ),
        title: Text(todo.topic),
      ),
    );
  }
}
