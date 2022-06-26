import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_module.dart';
import 'package:lista_de_tarefa/module/folder/folder_controller.dart';
import 'package:lista_de_tarefa/module/folder/folder_page.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';

class FolderModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => FolderService(database: i())),
        Bind.lazySingleton((i) => FolderController(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => FolderPage(controller: Modular.get())),
        ModuleRoute('/create', module: FolderCreateModule()),
      ];
}
