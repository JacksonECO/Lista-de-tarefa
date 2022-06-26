import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';

class FolderCreateController {
  final FolderService _service;

  FolderCreateController({required FolderService service}) : _service = service;

  Future<void> create({
    required String title,
    required String description,
  }) async {
    try {
      await _service.create(FolderModel(
        title: title,
        description: description,
      ));
      Modular.to.pop(true);
    } catch (e, s) {
      log('Error on create folder', name: 'FolderCreateController', error: e, stackTrace: s);
    }
  }
}
