import 'package:lista_de_tarefa/help/log.dart';

import 'package:lista_de_tarefa/services/folder_service.dart';

class FolderController {
  final FolderService _service;

  FolderController({required FolderService service}) : _service = service;

  Future<List<FolderModel>> getAllFolder() async {
    try {
      var list = await _service.getAll();
      list.sort((a, b) => a.title.compareTo(b.title));
      return list;
    } catch (e, s) {
      log('Error on get all folder', name: 'FolderController', error: e, stackTrace: s);
      return [];
    }
  }

  Future<bool> deleteFolder(FolderModel folder) async {
    try {
      await _service.delete(folder.id!);
      return true;
    } catch (e, s) {
      log('Error on delete folder', name: 'FolderController', error: e, stackTrace: s);
      return false;
    }
  }
}
