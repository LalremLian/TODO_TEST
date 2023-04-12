import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/model/Todo.dart';

class HomeController extends GetxController {

  var msgController = TextEditingController();

  var todos = <Todo>[].obs;

  void addTodo() {
    var title = msgController.text;

    if(title.isEmpty) return;

    todos.add(Todo(title: title));
    msgController.clear();
  }

  void toggleDone(int index) {
    todos[index].done = !todos[index].done;
    todos.refresh();
  }

  void remove(int index) {
    todos.removeAt(index);
  }

}
