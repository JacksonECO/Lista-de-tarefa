// Mocks generated by Mockito 5.2.0 from annotations
// in lista_de_tarefa/test/module/folder/folder_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:lista_de_tarefa/services/folder_service.dart' as _i2;
import 'package:lista_de_tarefa/view_models/folder_model.dart' as _i4;
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

/// A class which mocks [FolderService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFolderService extends _i1.Mock implements _i2.FolderService {
  MockFolderService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.FolderModel>> getAll() => (super.noSuchMethod(
          Invocation.method(#getAll, []),
          returnValue: Future<List<_i4.FolderModel>>.value(<_i4.FolderModel>[]))
      as _i3.Future<List<_i4.FolderModel>>);
  @override
  _i3.Future<int> create(_i4.FolderModel? folder) =>
      (super.noSuchMethod(Invocation.method(#create, [folder]),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
  @override
  _i3.Future<void> update(_i4.FolderModel? folder) =>
      (super.noSuchMethod(Invocation.method(#update, [folder]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
