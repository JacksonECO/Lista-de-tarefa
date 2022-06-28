import 'package:lista_de_tarefa/entities/database.dart';

class TaskModel {
  final int? id;

  String title;
  String? description;

  final int folderId;

  bool completed;
  DateTime? completedDate;

  DateTime? lastModified;
  DateTime? created;

  TaskModel({
    required this.title,
    required this.folderId,
    this.completed = false,
    this.id,
    String? description,
    this.lastModified,
    this.created,
    this.completedDate,
  })  : description = description == '' ? null : description,
        assert(title != '');

  factory TaskModel.fromEntity(Task entity) {
    return TaskModel(
      id: entity.id,
      folderId: entity.folderId,
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
      ..folderId = folderId
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
    int? folderId,
    bool? completed,
    DateTime? completedDate,
    DateTime? lastModified,
    DateTime? created,
  }) {
    if (completedDate == DateTime(0)) {
      completedDate = null;
      this.completedDate = null;
    }
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      folderId: folderId ?? this.folderId,
      completed: completed ?? this.completed,
      completedDate: completedDate ?? this.completedDate,
      lastModified: lastModified ?? this.lastModified,
      created: created ?? this.created,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, folderId: $folderId, completed: $completed, completedDate: $completedDate, lastModified: $lastModified, created: $created)';
  }
}
