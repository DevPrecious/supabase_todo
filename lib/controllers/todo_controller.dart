import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/models/todo_models.dart';

class TodoController extends GetxController {
  final supabase = Supabase.instance.client;
  RxList<TodoModel> todos = RxList<TodoModel>([]);
  RxBool isLoading = false.obs;
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> addTodo(String content) async {
    isLoading.value = true;
    await supabase.from('todos').insert({'content': content});
    getTodos();
    isLoading.value = false;
  }

  Future<void> getTodos() async {
    isLoading.value = true;
    final response = await supabase.from('todos').select('*');
    todos.value = response.map((e) => TodoModel.fromJson(e)).toList();
    print(response);
    isLoading.value = false;
  }

  Future<void> updateTodo(int id, bool isCompleted) async {
    isLoading.value = true;
    await supabase.from('todos').update({'is_completed': isCompleted}).eq('id', id);
    getTodos();
    isLoading.value = false;
  }
}
