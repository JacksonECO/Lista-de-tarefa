import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';

class TextFieldTaskWidget extends StatefulWidget {
  final TaskController controller;
  const TextFieldTaskWidget({super.key, required this.controller});

  @override
  State<TextFieldTaskWidget> createState() => _TextFieldTaskWidgetState();
}

class _TextFieldTaskWidgetState extends State<TextFieldTaskWidget> {
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[100]!,
            spreadRadius: 4,
            blurRadius: 30,
            blurStyle: BlurStyle.outer,
          ),
          BoxShadow(
            color: Colors.blueGrey[200]!,
            spreadRadius: 4,
            blurRadius: 70,
            blurStyle: BlurStyle.normal,
          ),
          BoxShadow(
            color: Colors.red[100]!,
            spreadRadius: 4,
            blurRadius: 70,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Digite sua tarefa:',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          ButtonLoading(
            isAnimation: false,
            width: 70,
            radius: 20,
            text: 'Add',
            onTap: () async {
              await widget.controller.addTask(_taskController.text);
              _taskController.clear();
            },
          ),
        ],
      ),
    );
  }
}
