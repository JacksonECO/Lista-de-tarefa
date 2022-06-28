import 'package:lista_de_tarefa/entities/folder.dart';

class FolderModel {
  final int? id;

  String title;
  String? description;

  DateTime? created;

  FolderModel({
    this.id,
    required this.title,
    String? description,
    this.created,
  })  : description = description == '' ? null : description,
        assert(title != '');

  factory FolderModel.fromEntity(Folder entity) {
    return FolderModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      created: entity.created,
    );
  }

  Folder toEntity() {
    return Folder()
      ..id = id
      ..title = title
      ..description = description
      ..created = created!;
  }

  FolderModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? created,
  }) {
    return FolderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      created: created ?? this.created,
    );
  }

  @override
  String toString() {
    return 'FolderModel(id: $id, title: $title, description: $description, created: $created)';
  }
}
