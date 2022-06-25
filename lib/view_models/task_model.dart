import 'package:lista_de_tarefa/entities/database.dart';

class TaskModel {
  final int? id;

  String title;
  String? description;

  final IsarLink<Folder> folder;

  bool completed;
  DateTime? completedDate;

  DateTime? lastModified;
  DateTime? created;

  TaskModel({
    required this.title,
    required this.folder,
    this.completed = false,
    this.id,
    this.description,
    this.lastModified,
    this.created,
    this.completedDate,
  });

  factory TaskModel.fromEntity(Task entity) {
    return TaskModel(
      id: entity.id,
      folder: entity.folder,
      title: entity.title,
      description: entity.description,
      completed: entity.completed,
      lastModified: entity.lastModified,
      created: entity.created,
      completedDate: entity.completedDate,
    );
  }

  Task toEntity() {
    return Task()
      ..id = id
      ..folder = folder
      ..title = title
      ..description = description
      ..completed = completed
      ..lastModified = lastModified!
      ..created = created!
      ..completedDate = completedDate;
  }



  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    IsarLink<Folder>? folder,
    bool? completed,
    DateTime? completedDate,
    DateTime? lastModified,
    DateTime? created,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      folder: folder ?? this.folder,
      completed: completed ?? this.completed,
      completedDate: completedDate ?? this.completedDate,
      lastModified: lastModified ?? this.lastModified,
      created: created ?? this.created,
    );
  }
}
