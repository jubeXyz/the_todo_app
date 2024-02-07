import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_filter.dart';
import 'package:the_todo_app/todo_item.dart';
import 'package:the_todo_app/todo_model.dart';

class TodoMainScreen extends StatefulWidget {
  const TodoMainScreen({
    super.key,
  });

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  TodoFilter todoFilter = TodoFilter.todoAll;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: Colors.lightBlue[500],
        actions: [
          Consumer<TodoProvider>(
            builder: (context, todoProvider, child) {
              return TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.pending_actions),
                    Text(
                      todoProvider.openTodos.length.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              );
            },
          ),
          Consumer<TodoProvider>(
            builder: (context, todoProvider, child) {
              return TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.done),
                    Text(
                      todoProvider.doneTodos.length.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TodoProvider>().todos.length,
        itemBuilder: (context, index) {
          return TodoItem(index: index);
        },
      ),
    );
  }
}
