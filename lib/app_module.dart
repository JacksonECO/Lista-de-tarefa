import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.lazySingleton((i) => Database()),
      ];

  @override
  List<ModularRoute> get routes => [
        // ModuleRoute('/', module: FolderModule()),
        // ModuleRoute('/task', module: TaskModule()),
      ];
}
