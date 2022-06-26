import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_page.dart';

class FolderCreateModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => FolderCreateController(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => FolderCreatePage(controller: Modular.get())),
      ];
}
