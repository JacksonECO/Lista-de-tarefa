// Mocks generated by Mockito 5.2.0 from annotations
// in lista_de_tarefa/test/module/task/task_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:lista_de_tarefa/services/task_service.dart' as _i2;
import 'package:lista_de_tarefa/view_models/folder_model.dart' as _i5;
import 'package:lista_de_tarefa/view_models/task_model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [TaskService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskService extends _i1.Mock implements _i2.TaskService {
  MockTaskService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.TaskModel>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
              returnValue: Future<List<_i4.TaskModel>>.value(<_i4.TaskModel>[]))
          as _i3.Future<List<_i4.TaskModel>>);
  @override
  _i3.Future<int> create(_i4.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#create, [task]),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
  @override
  _i3.Future<void> update(_i4.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#update, [task]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.TaskModel>> getTaskByFolder(_i5.FolderModel? folder) =>
      (super.noSuchMethod(Invocation.method(#getTaskByFolder, [folder]),
              returnValue: Future<List<_i4.TaskModel>>.value(<_i4.TaskModel>[]))
          as _i3.Future<List<_i4.TaskModel>>);
}
