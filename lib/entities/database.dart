import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lista_de_tarefa/entities/folder.dart';
import 'package:lista_de_tarefa/entities/task.dart';

export 'package:lista_de_tarefa/entities/folder.dart';
export 'package:lista_de_tarefa/entities/task.dart';
export 'package:isar/isar.dart';

class Database {
  static Isar? _databaseInstance;
  static bool isTemporary = false;
  static bool isInspector = false;

  Future<Isar> openConnectionIsa() async {
    if (_databaseInstance == null) {
      final dir = isTemporary ? await getTemporaryDirectory() : await getApplicationSupportDirectory();
      _databaseInstance = await Isar.open(
        directory: dir.path,
        inspector: isInspector,
        [
          TaskSchema,
          FolderSchema,
        ],
      );
    }

    return _databaseInstance!;
  }

  static Future<void> cleanAndClose() async {
    await clean();
    await close();
  }

  static Future<void> close() async {
    if (_databaseInstance == null) return;

    _databaseInstance!.close();
    _databaseInstance = null;
  }

  static Future<void> clean() async {
    if (_databaseInstance == null) return;

    await _databaseInstance!.writeTxn<void>(() async {
      return await _databaseInstance!.clear();
    });
  }
}
