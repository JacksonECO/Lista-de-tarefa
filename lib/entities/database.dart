import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lista_de_tarefa/entities/folder.dart';
import 'package:lista_de_tarefa/entities/task.dart';

export 'package:lista_de_tarefa/entities/folder.dart';
export 'package:lista_de_tarefa/entities/task.dart';
export 'package:isar/isar.dart';

class Database {
  static Isar? _databaseInstance;

  Future<Isar> openConnectionIsa() async {
    if (_databaseInstance == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseInstance = await Isar.open(
        directory: dir.path,
        inspector: true,
        schemas: [
          TaskSchema,
          FolderSchema,
        ],
      );
    }

    return _databaseInstance!;
  }
}
