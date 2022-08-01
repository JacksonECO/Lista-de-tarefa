import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_controller.dart';
import 'package:lista_de_tarefa/module/folder/create/folder_create_page.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../help_test/help_pop_page.dart';
import '../folder_page_test.mocks.dart';

@GenerateMocks(
  [FolderCreateController],
  customMocks: [
    MockSpec<NavigatorObserver>(returnNullOnMissingStub: true),
  ],
)
void main() {
  final folderCreateControllerMock = MockFolderCreateController();
  testWidgets('Garantir abertura da FolderCreatePage', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FolderCreatePage(controller: folderCreateControllerMock),
    ));

    final title = find.text('Nova Lista');
    expect(title, findsOneWidget);
    final formTitle = find.bySemanticsLabel('Título');
    expect(formTitle, findsOneWidget);
    final formDescription = find.bySemanticsLabel('Descrição (opcional)');
    expect(formDescription, findsOneWidget);
  });

  testWidgets('Garantir validação dos campos e funcionamento do botão para criar pastas', (tester) async {
    final String enterTextTitleFolder = 'New Folder';
    final navigatorObserverMock = MockNavigatorObserver();

    when(folderCreateControllerMock.create(title: enterTextTitleFolder, description: ''))
        .thenAnswer((_) => Future.value(true));

    final pop = await HelpPopPage.pumpWidget(
      tester: tester,
      child: FolderCreatePage(controller: folderCreateControllerMock),
      navigator: navigatorObserverMock,
    );

    final formTitle = find.bySemanticsLabel('Título');
    expect(formTitle, findsOneWidget);

    final button = find.byType(ButtonLoading);
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();

    var errorTitle = find.text('Titulo obrigatório!');
    expect(errorTitle, findsOneWidget);

    await tester.enterText(formTitle, enterTextTitleFolder);
    await tester.pump();

    errorTitle = find.text('Titulo obrigatório!');
    expect(errorTitle, findsNothing);

    await tester.tap(button);
    await tester.pumpAndSettle();
    verify(navigatorObserverMock.didPop(any, any)).called(1);

    final backPage = pop.finder;
    expect(backPage, findsOneWidget);
  });
}
