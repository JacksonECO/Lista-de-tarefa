import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/task_page.dart';
import 'package:lista_de_tarefa/services/task_service.dart';

class TaskModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => TaskService(database: i())),
        Bind.lazySingleton((i) => TaskController(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => TaskPage(
                  controller: Modular.get<TaskController>()..folder = args.data,
                )),
      ];
}
