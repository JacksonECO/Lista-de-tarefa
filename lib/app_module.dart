import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/entities/database.dart';
import 'package:lista_de_tarefa/module/folder/folder_module.dart';
import 'package:lista_de_tarefa/module/splash_page.dart';
import 'package:lista_de_tarefa/module/task/task_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Database()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
        ModuleRoute('/folder', module: FolderModule()),
        ModuleRoute('/task', module: TaskModule()),
      ];
}
