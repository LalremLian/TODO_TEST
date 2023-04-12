import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];

                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration:
                        todo.done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.done,
                      onChanged: (value) => controller.toggleDone(index),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.remove(index),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: TextField(
                controller: controller.msgController,
                decoration: const InputDecoration(
                  hintText: 'Type here...',
                ),
                onSubmitted: (_) {
                  controller.addTodo();
                  Get.focusScope?.unfocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

