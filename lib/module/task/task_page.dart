import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/widgets/task_tile.dart';
import 'package:lista_de_tarefa/module/task/widgets/text_field_task.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller;
  const TaskPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.folder.title),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(controller.isViewCompleted ? Icons.remove_circle_outline_sharp : Icons.check_circle),
              onPressed: () {
                controller.isViewCompleted = !controller.isViewCompleted;
              },
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Observer(builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listTask.length,
              itemBuilder: (context, index) {
                return Observer(builder: (_) {
                  return TaskTile(
                    controller: controller,
                    task: controller.listTask[index],
                  );
                });
              },
            );
          })),
          TextFieldTaskWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
