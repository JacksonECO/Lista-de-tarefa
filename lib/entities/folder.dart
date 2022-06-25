import 'package:isar/isar.dart';

part 'folder.g.dart';

@Collection()
class Folder {
  @Id()
  late final int? id;

  late String title;
  late String? description;

  late final DateTime created;
}
