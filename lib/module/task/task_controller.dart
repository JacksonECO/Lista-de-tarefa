// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:lista_de_tarefa/services/folder_service.dart';
import 'package:lista_de_tarefa/services/task_service.dart';
import 'package:mobx/mobx.dart';
part 'task_controller.g.dart';

class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  final TaskService _service;

  late FolderModel _folder;
  FolderModel get folder => _folder;
  set folder(FolderModel folder) {
    _folder = folder;
    _refresh();
  }

  _TaskControllerBase({
    required TaskService service,
  }) : _service = service;

  @observable
  ObservableList<TaskModel> _listTask = <TaskModel>[].asObservable();
  List<TaskModel> get listTask => _listTask.toList();
  set listTask(List<TaskModel> listTask) {
    _listTask = listTask.asObservable();
  }

  @observable
  bool _isViewCompleted = false;
  bool get isViewCompleted => _isViewCompleted;
  set isViewCompleted(bool isViewCompleted) {
    _isViewCompleted = isViewCompleted;
    _refresh(getDatabase: false);
  }

  // var helper
  List<TaskModel>? _listTaskOlder;
  bool forceGetDatabase = false;

  @action
  Future<void> addTask(String title) async {
    if (title.isEmpty) return;
    try {
      await _service.create(TaskModel(title: title, folderId: folder.id!));
      _refresh();
    } catch (e, s) {
      log('Error on addTask: $title', name: 'TaskController', error: e, stackTrace: s);
    }
  }

  @action
  Future<void> deleteTask(int id) async {
    try {
      await _service.delete(id);
    } catch (e, s) {
      log('Error on deleteTask: $id', name: 'TaskController', error: e, stackTrace: s);
    }
  }

  @action
  Future<void> updateTask(TaskModel task) async {
    try {
      await _service.update(task);

      final index = listTask.indexWhere((t) => t.id == task.id);
      var listRefresh = listTask;
      listRefresh[index] = task;
      listTask = listRefresh;

      forceGetDatabase = true;
    } catch (e, s) {
      log('Error on updateTask: ${task.title}', name: 'TaskController', error: e, stackTrace: s);
    }
  }

  Future<void> _refresh({
    bool getDatabase = true,
    bool orderBy = true,
  }) async {
    try {
      if (getDatabase || _listTaskOlder == null || forceGetDatabase) {
        forceGetDatabase = false;
        _listTaskOlder = await _service.getTaskByFolder(folder);
      }

      var listTaskTemp = _listTaskOlder!.where((element) {
        if (isViewCompleted) {
          return true;
        } else {
          return !element.completed;
        }
      }).toList();

      if (orderBy) {
        listTaskTemp.sort(((a, b) {
          try {
            if (a.completed && !b.completed) {
              return 1;
            } else if (!a.completed && b.completed) {
              return -1;
            } else {
              if (a.completed && b.completed) {
                return a.completedDate!.compareTo(b.completedDate!);
              }
              return a.created!.compareTo(b.created!);
            }
          } catch (s) {
            log('Error on sort: ${a.toString()}, ${b.toString()}', name: 'TaskController', error: s);
          }
          return 0;
        }));
      }

      listTask = listTaskTemp;
    } catch (e, s) {
      log('Error on refresh: ${folder.id}', name: 'TaskController', error: e, stackTrace: s);
    }
  }
}
