import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/services/task_service.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  final TaskController controller;
  const TaskTile({super.key, required this.task, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(task.title),
      value: task.completed,
      onChanged: (newCheck) {
        controller.updateTask(task.copyWith(completed: newCheck));
      },
    );
  }
}
