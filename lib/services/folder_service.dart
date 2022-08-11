import 'package:lista_de_tarefa/entities/database.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';

export 'package:lista_de_tarefa/view_models/folder_model.dart';

class FolderService {
  final Database _database;

  FolderService({required Database database}) : _database = database;

  Future<List<FolderModel>> getAll() async {
    final connection = await _database.openConnectionIsa();
    final get = await connection.folders.where().findAll();
    return get.map(FolderModel.fromEntity).toList();
  }

  Future<int> create(FolderModel folder) async {
    final connection = await _database.openConnectionIsa();
    return await connection.writeTxn<int>(() async {
      return await connection.folders.put(
        folder.copyWith(created: DateTime.now()).toEntity(),
      );
    });
  }

  Future<void> update(FolderModel folder) async {
    final connection = await _database.openConnectionIsa();
    await connection.writeTxn(() async {
      await connection.folders.put(folder.toEntity());
    });
  }

  Future<void> delete(int id) async {
    final connection = await _database.openConnectionIsa();
    final isDelete = await connection.writeTxn<bool>(() async {
      final folderTasks = await connection.tasks.filter().folderIdEqualTo(id).findAll();

      var listFuture = <Future>[];
      for (var i = 0; i < folderTasks.length; i++) {
        listFuture.add(connection.tasks.delete(folderTasks[i].id!));
      }
      await Future.wait(listFuture);

      return await connection.folders.delete(id);
    });
    if (!isDelete) {
      throw Exception('Error deleting folder');
    }
  }
}
