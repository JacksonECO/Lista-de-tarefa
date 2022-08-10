import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_page.dart';
import 'package:lista_de_tarefa/module/folder/folder_controller.dart';
import 'package:lista_de_tarefa/module/folder/folder_page.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'folder_page_test.mocks.dart';

@GenerateMocks(
  [FolderController, FolderCreateController, TaskController],
  customMocks: [
    MockSpec<NavigatorObserver>(returnNullOnMissingStub: true),
  ],
)
void main() {
  final folderControllerMock = MockFolderController();

  setUp(() {});

  testWidgets('Garantir abertura da FolderPage corretamente', (tester) async {
    String nameTitle = faker.lorem.word();

    when(folderControllerMock.getAllFolder()).thenAnswer(
      (_) async => <FolderModel>[
        FolderModel(title: nameTitle = nameTitle, id: faker.randomGenerator.integer(1000)),
        FolderModel(title: faker.conference.name(), id: faker.randomGenerator.integer(1000)),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: FolderPage(controller: folderControllerMock),
    ));

    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsOneWidget);
    final screenHome = find.byType(FolderPage);
    expect(screenHome, findsOneWidget);
    final title = find.text('Listas');
    expect(title, findsOneWidget);
    final addFolderButton = find.byType(FloatingActionButton);
    expect(addFolderButton, findsOneWidget);

    await tester.pump();

    final loading2 = find.byType(CircularProgressIndicator);
    expect(loading2, findsNothing);
    final folderList = find.byType(ListView);
    expect(folderList, findsOneWidget);

    final nFolder = find.byType(Slidable);
    expect(nFolder, findsNWidgets(2));
    final folder = find.text(nameTitle);
    expect(folder, findsOneWidget);
  });

  testWidgets('Garantir funcionamento do botão para adicionar Folder', (tester) async {
    when(folderControllerMock.getAllFolder()).thenAnswer(
      (_) async => <FolderModel>[
        FolderModel(title: faker.conference.name(), id: faker.randomGenerator.integer(1000)),
        FolderModel(title: faker.conference.name(), id: faker.randomGenerator.integer(1000)),
        FolderModel(title: faker.conference.name(), id: faker.randomGenerator.integer(1000)),
      ],
    );

    final navigatorObserverMock = MockNavigatorObserver();
    final folderCreateControllerMock = MockFolderCreateController();

    final nextRoute = MaterialPageRoute(
        builder: (_) => FolderCreatePage(
              controller: folderCreateControllerMock,
            ));

    await tester.pumpWidget(MaterialApp(
        home: FolderPage(controller: folderControllerMock),
        navigatorObservers: [navigatorObserverMock],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/folder/create/':
              return nextRoute;
            default:
              throw 'Route is anonymous';
          }
        }));

    final addFolderButton = find.byType(FloatingActionButton);
    expect(addFolderButton, findsOneWidget);

    await tester.tap(addFolderButton);

    await tester.pump();
    await tester.pump();

    verify(navigatorObserverMock.didPush(nextRoute, any)).called(1);

    final folderCreatePage = find.byType(FolderCreatePage);
    expect(folderCreatePage, findsOneWidget);
  });

  testWidgets('Garantir funcionamento do botão para abrir a Folder', (tester) async {
    String nameTitle = faker.lorem.sentence();
    final folderModel = FolderModel(title: nameTitle, id: faker.randomGenerator.integer(1000));
    final navigatorObserverMock = MockNavigatorObserver();
    final taskControllerMock = MockTaskController();

    when(folderControllerMock.getAllFolder()).thenAnswer(
      (_) async => <FolderModel>[
        folderModel,
        FolderModel(title: faker.lorem.sentence(), id: faker.randomGenerator.integer(1000)),
        FolderModel(title: faker.lorem.sentence(), id: faker.randomGenerator.integer(1000)),
      ],
    );

    when(taskControllerMock.folder).thenReturn(folderModel);
    when(taskControllerMock.listTask).thenReturn([]);
    when(taskControllerMock.isViewCompleted).thenReturn(false);

    final nextRoute = MaterialPageRoute(builder: (_) => Container(key: Key('nextPage_TaskPage')));

    await tester.pumpWidget(MaterialApp(
        home: FolderPage(controller: folderControllerMock),
        navigatorObservers: [navigatorObserverMock],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/task/':
              return nextRoute;
            default:
              throw 'Route is anonymous';
          }
        }));

    await tester.pump();

    final folderTap = find.text(nameTitle);
    expect(folderTap, findsOneWidget);

    await tester.tap(folderTap);

    await tester.pump();
    await tester.pump();

    verify(navigatorObserverMock.didPush(nextRoute, any)).called(1);

    final folderCreatePage = find.byKey(Key('nextPage_TaskPage'));
    expect(folderCreatePage, findsOneWidget);
  });
}
