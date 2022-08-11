import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lista_de_tarefa/entities/database.dart';
import 'package:lista_de_tarefa/main.dart' as app;
import 'package:lista_de_tarefa/module/folder/create/folder_create_page.dart';
import 'package:lista_de_tarefa/module/folder/folder_page.dart';
import 'package:lista_de_tarefa/module/task/task_page.dart';
import 'package:lista_de_tarefa/module/task/widgets/task_tile.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Database.isTemporary = true;

  tearDown(() async {
    await Database.clean();
  });

  tearDownAll(() async {
    await Database.cleanAndClose();
  });

  testWidgets('Created folder and task', (WidgetTester tester) async {
    app.main();

    await tester.pump();
    await tester.pump();
    await tester.pump();
    await tester.pump();
    expect(find.byType(FolderPage), findsOneWidget);

    //* Click Bottom to create a new folder
    final toPageAddFolder = find.byType(FloatingActionButton);
    expect(toPageAddFolder, findsOneWidget);
    await tester.tap(toPageAddFolder);
    await tester.pumpAndSettle();

    //* In Screen FolderCreatePage, add a title
    expect(find.byType(FolderCreatePage), findsOneWidget);
    final formTitle = find.bySemanticsLabel('Título');
    expect(formTitle, findsOneWidget);
    final textTitle = faker.lorem.word();
    await tester.enterText(formTitle, textTitle);
    await tester.pump();

    //* Click Button to create a new folder
    final button = find.byType(ButtonLoading);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();

    //* Verify if the folder was created
    expect(find.byType(FolderPage), findsOneWidget);
    var folderCreated = find.text(textTitle);
    expect(folderCreated, findsOneWidget);

    //* Click on the folder created
    await tester.tap(folderCreated);
    await tester.pumpAndSettle();

    //* Verify if the folder was opened and don't have any tasks
    expect(find.byType(TaskPage), findsOneWidget);
    expect(find.byType(TaskTile), findsNothing);

    //* Enter a title to a task
    final textEnter = faker.lorem.sentence();
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    //* Click Bottom to create a new task
    final buttonSend = find.widgetWithText(ButtonLoading, 'Add');
    expect(buttonSend, findsOneWidget);
    await tester.enterText(textField, textEnter);
    await tester.pump();
    expect(find.text(textEnter), findsOneWidget);
    await tester.tap(buttonSend);
    await tester.pumpAndSettle();

    //* Verify if the task was created
    expect(find.widgetWithText(TaskTile, textEnter), findsOneWidget);

    //* Back to Page: FolderPage
    await tester.pageBack();
    await tester.pump();
    expect(find.byType(FolderPage), findsOneWidget);
  });
}
