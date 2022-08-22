import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';

class TextFieldTaskWidget extends StatefulWidget {
  final TaskController controller;
  final ScrollController scrollController;
  const TextFieldTaskWidget({super.key, required this.controller, required this.scrollController});

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

  Future<void> onSend() async {
    final response = await widget.controller.addTask(_taskController.text);
    if (!response) return;

    _taskController.clear();
    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutQuad,
      );
    }
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
            color: Colors.green[100]!,
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
              onEditingComplete: onSend,
            ),
          ),
          ButtonLoading(
            isAnimation: false,
            width: 70,
            radius: 20,
            text: 'Add',
            onTap: onSend,
          ),
        ],
      ),
    );
  }
}
