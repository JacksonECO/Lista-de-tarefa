import 'dart:developer';

import 'package:lista_de_tarefa/services/folder_service.dart';

class FolderController {
  final FolderService _service;

  FolderController({required FolderService service}) : _service = service;

  Future<List<FolderModel>> getAllFolder() async {
    try {
      return _service.getAll();
    } catch (e, s) {
      log('Error on get all folder', name: 'FolderController', error: e, stackTrace: s);
      return [];
    }
  }

  Future<void> deleteFolder(FolderModel folder) async {
    try {
      await _service.delete(folder.id!);
    } catch (e, s) {
      log('Error on delete folder', name: 'FolderController', error: e, stackTrace: s);
    }
  }
}
