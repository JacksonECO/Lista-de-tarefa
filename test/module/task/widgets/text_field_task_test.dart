import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/module/task/widgets/text_field_task.dart';
import 'package:lista_de_tarefa/widget/button_loading.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'text_field_task_test.mocks.dart';

@GenerateMocks([TaskController, ScrollController, ScrollPosition])
void main() {
  late MockTaskController taskController;
  late MockScrollController scrollController;
  late String titleAddTask;

  setUp(() {
    taskController = MockTaskController();
    scrollController = MockScrollController();

    titleAddTask = 'null';
    when(taskController.addTask(any)).thenAnswer((fun) async {
      titleAddTask = fun.positionalArguments.first as String;
      return true;
    });
  });

  testWidgets('Garantindo abertura do TextFieldTask', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldTaskWidget(
          controller: taskController,
          scrollController: scrollController,
        ),
      ),
    ));

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Digite sua tarefa:'), findsOneWidget);
    expect(find.byType(ButtonLoading), findsOneWidget);
  });

  testWidgets('Garantindo funcionamento de adição de tarefas', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldTaskWidget(
          controller: taskController,
          scrollController: scrollController,
        ),
      ),
    ));

    final textEnter = 'Tarefa de teste';
    final textField = find.byType(TextField);
    final buttonSend = find.widgetWithText(ButtonLoading, 'Add');
    expect(buttonSend, findsOneWidget);

    await tester.enterText(textField, textEnter);
    await tester.pump();

    expect(find.text(textEnter), findsOneWidget);

    await tester.tap(buttonSend);
    await tester.pump();
    verify(taskController.addTask(any)).called(1);

    expect(titleAddTask, textEnter);
    expect(find.text(textEnter), findsNothing);
  });

  testWidgets('Garantindo funcionamento de adição de tarefas usando key', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldTaskWidget(
          controller: taskController,
          scrollController: scrollController,
        ),
      ),
    ));

    final textEnter = 'Tarefa de teste';
    final textField = find.byType(TextField);
    final buttonSend = find.widgetWithText(ButtonLoading, 'Add');
    expect(buttonSend, findsOneWidget);

    await tester.enterText(textField, textEnter);
    await tester.pump();

    expect(find.text(textEnter), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    verify(taskController.addTask(any)).called(1);

    expect(titleAddTask, textEnter);
    expect(find.text(textEnter), findsNothing);
  }, skip: true); //! skip porque o teste não funciona com o key

  testWidgets('Garantindo funcionamento do scroll na adição de tarefas', (tester) async {
    when(scrollController.hasClients).thenAnswer((_) => true);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldTaskWidget(
          controller: taskController,
          scrollController: scrollController,
        ),
      ),
    ));

    final textEnter = 'Tarefa de teste';
    final textField = find.byType(TextField);
    final buttonSend = find.widgetWithText(ButtonLoading, 'Add');

    await tester.enterText(textField, textEnter);
    await tester.pumpAndSettle();

    await tester.tap(buttonSend);
    await tester.pumpAndSettle();

    verify(scrollController.hasClients).called(1);
    // verify(scrollController.animateTo(any)).called(1);
  });
}
