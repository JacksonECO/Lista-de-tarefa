import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'folder_create_controller_test.mocks.dart';

@GenerateMocks([FolderService])
void main() {
  late FolderService folderServiceMock;
  late FolderCreateController folderCreateControllerMock;

  setUp(() {
    folderServiceMock = MockFolderService();
    folderCreateControllerMock = FolderCreateController(service: folderServiceMock);
  });
  test('Garantir a criação de de uma nova pasta', () async {
    final model = FolderModel(title: 'a', description: 'b');

    when(folderServiceMock.create(model)).thenAnswer(
      (_) async => faker.randomGenerator.integer(1000),
    );

    final response = await folderCreateControllerMock.create(
      title: model.title,
      description: model.description,
    );
    expect(response, isTrue);
  });

  test('Garantir resposta negativa caso aconteça algum erro', () async {
    final model = FolderModel(title: 'a', description: 'b');

    when(folderServiceMock.create(model)).thenThrow(Exception('Error'));

    final response = await folderCreateControllerMock.create(
      title: model.title,
      description: model.description,
    );
    expect(response, isFalse);
  });
}
