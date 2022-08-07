import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/task_page.dart';
import 'package:lista_de_tarefa/module/task/widgets/task_tile.dart';
import 'package:lista_de_tarefa/module/task/widgets/text_field_task.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';
import 'package:lista_de_tarefa/view_models/task_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_page_test.mocks.dart';

@GenerateMocks([TaskController])
void main() {
  late MockTaskController taskControllerMock;
  late FolderModel folder;
  late List<TaskModel> tasks;
  bool isViewCompletedMock = false;

  setUp(() {
    isViewCompletedMock = false;

    folder = FolderModel(
      id: faker.randomGenerator.integer(1000),
      title: faker.lorem.sentence(),
    );

    tasks = List.generate(
      faker.randomGenerator.integer(9),
      (index) => TaskModel(
        folderId: folder.id!,
        id: faker.randomGenerator.integer(1000),
        title: faker.lorem.sentence(),
        completed: faker.randomGenerator.boolean(),
      ),
    );

    taskControllerMock = MockTaskController()..folder = folder;

    when(taskControllerMock.folder).thenReturn(folder);
    when(taskControllerMock.listTask)
        .thenAnswer((_) => tasks.where((element) => isViewCompletedMock || !element.completed).toList());
    when(taskControllerMock.isViewCompleted).thenAnswer((_) => isViewCompletedMock);
    when(taskControllerMock.isViewCompleted = any).thenAnswer((param) {
      isViewCompletedMock = param.positionalArguments.first as bool;
    });
  });

  testWidgets('Garantindo abertura da tela TaskPage', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TaskPage(
        controller: taskControllerMock,
        scrollController: ScrollController(),
      ),
    ));

    expect(find.text(folder.title), findsWidgets);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.byType(TextFieldTaskWidget), findsOneWidget);
    expect(find.byType(TaskTile), findsNWidgets(tasks.where((element) => !element.completed).length));
  });

  testWidgets('Garantindo funcionamento da mudança de valor do isViewCompleted', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TaskPage(
        controller: taskControllerMock,
        scrollController: ScrollController(),
      ),
    ));

    final falseViewCompleted = find.byIcon(Icons.check_circle);
    final trueViewCompleted = find.byIcon(Icons.remove_circle_outline_sharp);

    expect(falseViewCompleted, findsOneWidget);
    expect(trueViewCompleted, findsNothing);
    expect(find.byType(TaskTile), findsNWidgets(tasks.where((element) => !element.completed).length));

    await tester.tap(falseViewCompleted);
    expect(isViewCompletedMock, isTrue);

    await tester.pumpWidget(MaterialApp(
      home: TaskPage(
        controller: taskControllerMock,
        scrollController: ScrollController(),
      ),
    ));

    expect(isViewCompletedMock, isTrue);
    expect(falseViewCompleted, findsNothing);
    expect(trueViewCompleted, findsOneWidget);
    expect(find.byType(TaskTile), findsNWidgets(tasks.length));

    await tester.tap(trueViewCompleted);
    expect(isViewCompletedMock, isFalse);
  });
}
