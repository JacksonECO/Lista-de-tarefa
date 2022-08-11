import 'package:lista_de_tarefa/entities/database.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';
import 'package:lista_de_tarefa/view_models/task_model.dart';

export 'package:lista_de_tarefa/view_models/task_model.dart';

class TaskService {
  final Database _database;
  TaskService({required Database database}) : _database = database;

  Future<List<TaskModel>> getAll() async {
    final connection = await _database.openConnectionIsa();
    final get = await connection.tasks.where().findAll();
    return get.map(TaskModel.fromEntity).toList();
  }

  Future<int> create(TaskModel task) async {
    final connection = await _database.openConnectionIsa();
    return await connection.writeTxn<int>(() async {
      return await connection.tasks.put(task
          .copyWith(
            created: DateTime.now(),
            lastModified: DateTime.now(),
          )
          .toEntity());
    });
  }

  Future<void> update(TaskModel task) async {
    final connection = await _database.openConnectionIsa();
    await connection.writeTxn(() async {
      bool completedOlder = (await connection.tasks.get(task.id!))!.completed;

      if (completedOlder == task.completed) {
        await connection.tasks.put(task.copyWith(lastModified: DateTime.now()).toEntity());
      } else if (completedOlder) {
        // true -> false
        await connection.tasks.put(task.copyWith(completedDate: DateTime(0), lastModified: DateTime.now()).toEntity());
      } else {
        // false -> true
        await connection.tasks
            .put(task.copyWith(completedDate: DateTime.now(), lastModified: DateTime.now()).toEntity());
      }
    });
  }

  Future<void> delete(int id) async {
    final connection = await _database.openConnectionIsa();
    final isDelete = await connection.writeTxn(() async {
      return await connection.tasks.delete(id);
    });
    if (!isDelete) {
      throw Exception('Error deleting task');
    }
  }

  Future<List<TaskModel>> getTaskByFolder(FolderModel folder) async {
    final connection = await _database.openConnectionIsa();
    final get = await connection.tasks.filter().folderIdEqualTo(folder.id!).findAll();
    return get.map(TaskModel.fromEntity).toList();
  }
}
