import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/widgets/task_tile.dart';
import 'package:lista_de_tarefa/view_models/task_model.dart';

import 'task_tile_test.mocks.dart';

@GenerateMocks([TaskController])
void main() {
  testWidgets('Garantindo o widget TaskTile', (tester) async {
    //? Vale ressaltar que TaskTile é um stateless widget, não salva seu status.

    final statusInit = faker.randomGenerator.boolean();
    TaskModel taskCurrent = TaskModel(
      title: faker.lorem.sentence(),
      folderId: faker.randomGenerator.integer(1000),
      completed: statusInit,
    );

    MockTaskController controller = MockTaskController();
    when(controller.updateTask(any)).thenAnswer((fun) {
      taskCurrent = fun.positionalArguments[0] as TaskModel;
      return Future.value(true);
    });

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskTile(
          task: taskCurrent,
          controller: controller,
        ),
      ),
    ));

    expect(find.byType(CheckboxListTile), findsOneWidget);

    final title = find.text(taskCurrent.title);
    expect(title, findsOneWidget);

    expect(taskCurrent.completed, statusInit);

    await tester.tap(title);
    await tester.pump();
    expect(taskCurrent.completed, !statusInit);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskTile(
          task: taskCurrent,
          controller: controller,
        ),
      ),
    ));

    await tester.tap(title);
    await tester.pump();
    expect(taskCurrent.completed, statusInit);
  });
}
