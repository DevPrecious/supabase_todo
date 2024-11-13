import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController todoTextController = TextEditingController();
  List<bool> selectedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Todo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: todoTextController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoController.addTodo(todoTextController.text);
                      Navigator.pop(context);
                      todoTextController.clear();
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  return todoController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListTile(
                          leading: Checkbox(
                            value: todoController.todos[index].isCompleted,
                            onChanged: (bool? value) {
                              todoController.updateTodo(
                                  todoController.todos[index].id,
                                  value ?? false);
                            },
                          ),
                          title: Text(
                              todoController.todos[index].content.toString()),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
