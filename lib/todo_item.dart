import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_details_screen.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.updateItemStatus,
  });

  final Todo todo;
  final void Function(bool) updateItemStatus;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailsScreen(
              todo: widget.todo,
              statusCheck: (bool statusCheck) {
                setState(() {
                  widget.todo.isDone = statusCheck;
                  widget.updateItemStatus(statusCheck);
                });
              },
            ),
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.isDone,
          onChanged: (bool? newStatus) {
            setState(() {
              widget.todo.isDone = newStatus ?? false;
              widget.updateItemStatus(newStatus ?? false);
            });
          },
        ),
        title: Text(widget.todo.topic),
      ),
    );
  }
}
