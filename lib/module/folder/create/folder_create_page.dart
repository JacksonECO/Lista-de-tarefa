import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';
import 'package:validatorless/validatorless.dart';

class FolderCreatePage extends StatefulWidget {
  final FolderCreateController controller;
  const FolderCreatePage({super.key, required this.controller});

  @override
  State<FolderCreatePage> createState() => _FolderCreatePageState();
}

class _FolderCreatePageState extends State<FolderCreatePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nova Lista'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                validator: Validatorless.required('Titulo obrigatório!'),
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: TextFormField(
                  minLines: 3,
                  maxLines: 1000,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Descrição (opcional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ButtonLoading(
                onTap: () => widget.controller.create(
                  title: _titleController.text,
                  description: _descriptionController.text,
                ),
                text: 'Salvar',
              ),
            ],
          ),
        ));
  }
}
