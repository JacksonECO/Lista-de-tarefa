import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/module/task/task_controller.dart';
import 'package:lista_de_tarefa/services/task_service.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_controller_test.mocks.dart';

@GenerateMocks([TaskService])
void main() {
  late TaskController controller;
  final serviceMock = MockTaskService();

  final folder = FolderModel(
    id: faker.randomGenerator.integer(1000),
    title: faker.lorem.words(2).join(' '),
  );
  final task = TaskModel(
    title: faker.lorem.sentence(),
    id: faker.randomGenerator.integer(1000),
    folderId: folder.id!,
  );

  setUp(() {
    controller = TaskController(service: serviceMock)..folder = folder;
  });

  test('Garante funcionamento correto do addTask', () async {
    //? Uma vez que a criação envolve o banco de dados, não é possível testar totalmente funcionamento do método, apenas seu retorno.
    final title = faker.lorem.sentence();
    when(serviceMock.create(TaskModel(title: title, folderId: folder.id!))).thenAnswer(
      (_) => Future.value(faker.randomGenerator.integer(1000)),
    );

    final addTask = await controller.addTask(title);
    expect(addTask, isTrue);
  });

  test('Garante retorno negativo caso tenha algum erro ao criar uma task (addTask)', () async {
    //? Uma vez que a criação envolve o banco de dados, não é possível testar totalmente funcionamento do método, apenas seu retorno.
    final title = task.title;
    when(serviceMock.create(TaskModel(title: title, folderId: folder.id!))).thenThrow(Exception('Error'));

    final addTaskWithError = await controller.addTask(title);
    expect(addTaskWithError, isFalse);
  });

  test('Garantir funcionamento correto do deleteTask', () async {
    controller.listTask = [task];
    when(serviceMock.delete(task.id!)).thenAnswer((_) => Future.value(true));

    var listContaisTask = controller.listTask.contains(task);
    expect(listContaisTask, isTrue);

    final remove = await controller.deleteTask(task.id!);
    expect(remove, isTrue);

    listContaisTask = controller.listTask.contains(task);
    expect(listContaisTask, isFalse);
  });

  test('Garante retorno negativo caso tenha algum erro ao remover uma task (deleteTask)', () async {
    controller.listTask = [task];
    when(serviceMock.delete(task.id!)).thenThrow(Exception('Error'));

    var listContaisTask = controller.listTask.contains(task);
    expect(listContaisTask, isTrue);

    final removeWithError = await controller.deleteTask(task.id!);
    expect(removeWithError, isFalse);

    listContaisTask = controller.listTask.contains(task);
    expect(listContaisTask, isTrue);
  });

  test('Garantir funcionamento correto do updateTask', () async {
    controller.listTask = [task];
    final newTitle = faker.lorem.sentence();
    when(serviceMock.update(task.copyWith(title: newTitle))).thenAnswer((_) => Future.value(true));

    var listContaisTask = controller.listTask.where((element) => element.id == task.id);
    expect(listContaisTask.length, 1);
    expect(listContaisTask.first, task);

    final remove = await controller.updateTask(task.copyWith(title: newTitle));
    expect(remove, isTrue);

    listContaisTask = controller.listTask.where((element) => element.id == task.id);
    expect(listContaisTask.length, 1);
    expect(listContaisTask.first, task.copyWith(title: newTitle));
  });

  test('Garante retorno negativo caso tenha algum erro ao editar uma task (updateTask)', () async {
    controller.listTask = [task];
    final newTitle = faker.lorem.sentence();
    when(serviceMock.update(task.copyWith(title: newTitle))).thenThrow(Exception('Error'));

    var listContaisTask = controller.listTask.where((element) => element.id == task.id);
    expect(listContaisTask.length, 1);
    expect(listContaisTask.first, task);

    final remove = await controller.updateTask(task.copyWith(title: newTitle));
    expect(remove, isFalse);

    listContaisTask = controller.listTask.where((element) => element.id == task.id);
    expect(listContaisTask.length, 1);
    expect(listContaisTask.first, task);
  });

  test('Garantindo o funcionamento parcial do método privado _refresh', () async {
    List<TaskModel> listTask = List.generate(
      100,
      (index) {
        final create = faker.date.dateTime(maxYear: 2000);
        final completed = faker.randomGenerator.boolean();
        return TaskModel(
          title: faker.lorem.sentence(),
          description: faker.lorem.sentence(),
          id: index,
          folderId: folder.id!,
          created: create,
          lastModified: create,
          completed: completed,
          completedDate: completed ? faker.date.dateTime(minYear: create.year + 1) : null,
        );
      },
    );
    when(serviceMock.getTaskByFolder(any)).thenAnswer((_) => Future.value(listTask));

    controller.listTask = listTask;
    controller.isViewCompleted = false;

    await Future.delayed(Duration(microseconds: 1));
    expect(
      controller.listTask.length,
      listTask.where((element) => element.completed == false).length,
    );

    controller.isViewCompleted = true;
    listTask.sort(((a, b) {
      if (a.completed && !b.completed) {
        return 1;
      } else if (!a.completed && b.completed) {
        return -1;
      } else {
        if (a.completed && b.completed) {
          return a.completedDate!.compareTo(b.completedDate!);
        }
        return a.created!.compareTo(b.created!);
      }
    }));

    await Future.delayed(Duration(microseconds: 1));
    expect(controller.listTask, listTask);
  });

  test('Garantir utilização de tarefas com inconsistência (without date)', () async {
    List<TaskModel> listTask = List.generate(
      100,
      (index) {
        return TaskModel(
          title: faker.lorem.sentence(),
          description: faker.lorem.sentence(),
          id: index,
          folderId: folder.id!,
          completed: faker.randomGenerator.boolean(),
        );
      },
    );
    when(serviceMock.getTaskByFolder(any)).thenAnswer((_) => Future.value(listTask));

    controller.listTask = listTask;
    controller.isViewCompleted = true;

    await Future.delayed(Duration(microseconds: 1));
    expect(controller.listTask.length, listTask.length);
    expect(controller.listTask == listTask, isFalse);
  });

  test('Garantir consistência no método listTask', () {
    List<TaskModel> listTask = List.generate(
      100,
      (index) => TaskModel(
        title: faker.lorem.sentence(),
        folderId: folder.id!,
      ),
    );

    controller.listTask = listTask;
    expect(controller.listTask, isA<List<TaskModel>>());
    expect(controller.listTask, listTask);
  });
}
