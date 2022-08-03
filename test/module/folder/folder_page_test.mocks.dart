// Mocks generated by Mockito 5.2.0 from annotations
// in lista_de_tarefa/test/module/folder/folder_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:flutter/src/widgets/navigator.dart' as _i9;
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart'
    as _i6;
import 'package:lista_de_tarefa/module/folder/folder_controller.dart' as _i4;
import 'package:lista_de_tarefa/module/task/task_controller.dart' as _i7;
import 'package:lista_de_tarefa/services/folder_service.dart' as _i2;
import 'package:lista_de_tarefa/services/task_service.dart' as _i8;
import 'package:mobx/mobx.dart' as _i3;
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

class _FakeFolderModel_0 extends _i1.Fake implements _i2.FolderModel {}

class _FakeReactiveContext_1 extends _i1.Fake implements _i3.ReactiveContext {}

/// A class which mocks [FolderController].
///
/// See the documentation for Mockito's code generation for more information.
class MockFolderController extends _i1.Mock implements _i4.FolderController {
  MockFolderController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.FolderModel>> getAllFolder() => (super.noSuchMethod(
          Invocation.method(#getAllFolder, []),
          returnValue: Future<List<_i2.FolderModel>>.value(<_i2.FolderModel>[]))
      as _i5.Future<List<_i2.FolderModel>>);
  @override
  _i5.Future<bool> deleteFolder(_i2.FolderModel? folder) =>
      (super.noSuchMethod(Invocation.method(#deleteFolder, [folder]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [FolderCreateController].
///
/// See the documentation for Mockito's code generation for more information.
class MockFolderCreateController extends _i1.Mock
    implements _i6.FolderCreateController {
  MockFolderCreateController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> create({String? title, String? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #create, [], {#title: title, #description: description}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [TaskController].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskController extends _i1.Mock implements _i7.TaskController {
  MockTaskController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FolderModel get folder => (super.noSuchMethod(Invocation.getter(#folder),
      returnValue: _FakeFolderModel_0()) as _i2.FolderModel);
  @override
  set folder(_i2.FolderModel? folder) =>
      super.noSuchMethod(Invocation.setter(#folder, folder),
          returnValueForMissingStub: null);
  @override
  List<_i8.TaskModel> get listTask =>
      (super.noSuchMethod(Invocation.getter(#listTask),
          returnValue: <_i8.TaskModel>[]) as List<_i8.TaskModel>);
  @override
  set listTask(List<_i8.TaskModel>? listTask) =>
      super.noSuchMethod(Invocation.setter(#listTask, listTask),
          returnValueForMissingStub: null);
  @override
  bool get isViewCompleted => (super
          .noSuchMethod(Invocation.getter(#isViewCompleted), returnValue: false)
      as bool);
  @override
  set isViewCompleted(bool? value) =>
      super.noSuchMethod(Invocation.setter(#isViewCompleted, value),
          returnValueForMissingStub: null);
  @override
  _i3.ReactiveContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeReactiveContext_1()) as _i3.ReactiveContext);
  @override
  _i5.Future<bool> addTask(String? title) =>
      (super.noSuchMethod(Invocation.method(#addTask, [title]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> deleteTask(int? id) =>
      (super.noSuchMethod(Invocation.method(#deleteTask, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> updateTask(_i8.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#updateTask, [task]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i9.NavigatorObserver {
  @override
  void didPush(_i9.Route<dynamic>? route, _i9.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPush, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didPop(_i9.Route<dynamic>? route, _i9.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPop, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didRemove(
          _i9.Route<dynamic>? route, _i9.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didRemove, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didReplace(
          {_i9.Route<dynamic>? newRoute, _i9.Route<dynamic>? oldRoute}) =>
      super.noSuchMethod(
          Invocation.method(
              #didReplace, [], {#newRoute: newRoute, #oldRoute: oldRoute}),
          returnValueForMissingStub: null);
  @override
  void didStartUserGesture(
          _i9.Route<dynamic>? route, _i9.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(
          Invocation.method(#didStartUserGesture, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didStopUserGesture() =>
      super.noSuchMethod(Invocation.method(#didStopUserGesture, []),
          returnValueForMissingStub: null);
}
