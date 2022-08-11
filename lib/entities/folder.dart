import 'package:isar/isar.dart';

part 'folder.g.dart';

@Collection()
class Folder {
  Id? id = Isar.autoIncrement;

  late String title;
  late String? description;

  late final DateTime created;
}
