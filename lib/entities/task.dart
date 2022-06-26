import 'package:lista_de_tarefa/entities/database.dart';

part 'task.g.dart';

@Collection()
class Task {
  @Id()
  int? id;

  IsarLink<Folder> folder = IsarLink<Folder>();

  late String title;
  late String? description;

  late bool completed;
  late DateTime? completedDate;

  late DateTime lastModified;
  late final DateTime created;
}
