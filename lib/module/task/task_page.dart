import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/widgets/task_tile.dart';
import 'package:lista_de_tarefa/module/task/widgets/text_field_task.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;

  const TaskPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.controller.folder.title),
        actions: [
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(widget.controller.isViewCompleted ? Icons.remove_circle_outline_sharp : Icons.check_circle),
              onPressed: () async {
                if (!widget.controller.isViewCompleted) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent + MediaQuery.of(context).size.height * 0.6,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutQuad,
                  );
                }
                widget.controller.isViewCompleted = !widget.controller.isViewCompleted;
              },
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Observer(builder: (_) {
            return ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: widget.controller.listTask.length,
              itemBuilder: (context, index) {
                return Observer(builder: (_) {
                  return TaskTile(
                    controller: widget.controller,
                    task: widget.controller.listTask[index],
                  );
                });
              },
            );
          })),
          TextFieldTaskWidget(
            controller: widget.controller,
            scrollController: scrollController,
          ),
        ],
      ),
    );
  }
}
