import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/services/task_service.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';

class TaskPage extends StatelessWidget {
  final FolderModel folder;
  const TaskPage({Key? key, required this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Modular.get<TaskService>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(folder.title),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<TaskModel>>(
        future: service.getTaskByFolder(folder),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(snapshot.data![index].title),
                value: snapshot.data![index].completed,
                onChanged: (newCheck) {},
              );
            },
          );
        },
      ),
    );
  }
}
