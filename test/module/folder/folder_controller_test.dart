import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/folder/folder_controller.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'folder_controller_test.mocks.dart';

@GenerateMocks([FolderService])
void main() {
  late FolderService folderServiceMock;
  late FolderController folderController;

  setUp(() {
    folderServiceMock = MockFolderService();
    folderController = FolderController(service: folderServiceMock);

    when(folderServiceMock.getAll()).thenAnswer((_) async => <FolderModel>[
          FolderModel(title: 'c'),
          FolderModel(title: 'a'),
          FolderModel(title: 'b'),
        ]);

    when(folderServiceMock.delete(1)).thenAnswer((_) async => true);
  });

  test('Garantir retorno de todas as pastas ordenadas pelo título', () async {
    final listFolder = await folderController.getAllFolder();
    expect(listFolder.length, 3);

    expect(listFolder[0].title, 'a');
    expect(listFolder[1].title, 'b');
    expect(listFolder[2].title, 'c');
  });

  test('Garantir retorno de uma lista vazia caso aconteça algum error', () async {
    when(folderServiceMock.getAll()).thenThrow(Exception('Error'));

    final listFolder = await folderController.getAllFolder();
    expect(listFolder.length, 0);
  });

  test('Garantir exclusão de uma pasta ao fornecer um FolderModel com id', () async {
    final delete = await folderController.deleteFolder(
      FolderModel(title: 'a', id: 1),
    );
    expect(delete, isTrue);
  });

  test('Garantir retorno negativo para exclusão de uma pasta com um FolderModel sem id', () async {
    final delete = await folderController.deleteFolder(
      FolderModel(title: 'a'),
    );
    expect(delete, isFalse);
  });

  test('Garantir retorno negativo para exclusão coso tenha lançamento de uma exceção', () async {
    when(folderServiceMock.delete(1)).thenThrow(Exception('Error'));

    final delete = await folderController.deleteFolder(
      FolderModel(title: 'a', id: 1),
    );
    expect(delete, isFalse);
  });
}
