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
    return await connection.writeTxn<int>((isar) async {
      return await isar.folders.put(
        folder.copyWith(created: DateTime.now()).toEntity(),
      );
    });
  }

  Future<void> update(FolderModel folder) async {
    final connection = await _database.openConnectionIsa();
    await connection.writeTxn((isar) async {
      await isar.folders.put(folder.toEntity());
    });
  }

  Future<void> delete(int id) async {
    // TODO: delete tasks from folder too
    final connection = await _database.openConnectionIsa();
    final isDelete = await connection.writeTxn((isar) async {
      await isar.folders.delete(id);
    });
    if (!isDelete) {
      throw Exception('Não foi possível deletar a pasta');
    }
  }
}
