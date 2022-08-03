// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on _TaskControllerBase, Store {
  late final _$_listTaskAtom =
      Atom(name: '_TaskControllerBase._listTask', context: context);

  @override
  ObservableList<TaskModel> get _listTask {
    _$_listTaskAtom.reportRead();
    return super._listTask;
  }

  @override
  set _listTask(ObservableList<TaskModel> value) {
    _$_listTaskAtom.reportWrite(value, super._listTask, () {
      super._listTask = value;
    });
  }

  late final _$_isViewCompletedAtom =
      Atom(name: '_TaskControllerBase._isViewCompleted', context: context);

  @override
  bool get _isViewCompleted {
    _$_isViewCompletedAtom.reportRead();
    return super._isViewCompleted;
  }

  @override
  set _isViewCompleted(bool value) {
    _$_isViewCompletedAtom.reportWrite(value, super._isViewCompleted, () {
      super._isViewCompleted = value;
    });
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_TaskControllerBase.addTask', context: context);

  @override
  Future<bool> addTask(String title) {
    return _$addTaskAsyncAction.run(() => super.addTask(title));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_TaskControllerBase.deleteTask', context: context);

  @override
  Future<bool> deleteTask(int id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$updateTaskAsyncAction =
      AsyncAction('_TaskControllerBase.updateTask', context: context);

  @override
  Future<bool> updateTask(TaskModel task) {
    return _$updateTaskAsyncAction.run(() => super.updateTask(task));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
