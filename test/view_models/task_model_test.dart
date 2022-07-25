import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/view_models/task_model.dart';

void main() {
  group('Testando o Construtor do FolderModel', () {
    testWidgets('Criando TaskModel Simples', (tester) async {
      final idFolder = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();

      final folder = TaskModel(
        folderId: idFolder,
        title: title,
      );

      expect(folder.folderId, idFolder);
      expect(folder.title, title);
    });

    testWidgets('Criando FolderModel com descrição vazia ""', (tester) async {
      final title = faker.lorem.word();
      final idFolder = faker.randomGenerator.integer(1000);

      final folder = TaskModel(
        folderId: idFolder,
        title: title,
        description: '',
      );

      expect(folder.description, isNull);
    });

    testWidgets('Criando FolderModel com title vazio ""', (tester) async {
      final idFolder = faker.randomGenerator.integer(1000);
      expect(
          () => TaskModel(
                folderId: idFolder,
                title: '',
              ),
          throwsAssertionError);
    });
  });

  group('Testando a integração com a Entity do FolderModel', () {
    testWidgets('Testando toEntity e fromEntity', (tester) async {
      final id = faker.randomGenerator.integer(1000);
      final idFolder = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final description = faker.lorem.sentence();
      final date = faker.date.dateTime();
      final date1 = faker.date.dateTime();
      final date2 = faker.date.dateTime();
      final completed = faker.randomGenerator.boolean();

      final folder = TaskModel(
        id: id,
        folderId: idFolder,
        title: title,
        description: description,
        created: date,
        lastModified: date1,
        completedDate: date2,
        completed: completed,
      ).toEntity();

      expect(folder.id, id);
      expect(folder.folderId, idFolder);
      expect(folder.title, title);
      expect(folder.description, description);
      expect(folder.created, date);
      expect(folder.lastModified, date1);
      expect(folder.completedDate, date2);
      expect(folder.completed, completed);

      final folderFromEntity = TaskModel.fromEntity(folder);

      expect(folderFromEntity.id, id);
      expect(folderFromEntity.folderId, idFolder);
      expect(folderFromEntity.title, title);
      expect(folderFromEntity.description, description);
      expect(folderFromEntity.created, date);
      expect(folderFromEntity.lastModified, date1);
      expect(folderFromEntity.completedDate, date2);
      expect(folderFromEntity.completed, completed);
    });

    testWidgets('Convertendo para Entity sem datas', (tester) async {
      final idFolder = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final date = faker.date.dateTime();
      var erro;

      try {
        TaskModel(
          folderId: idFolder,
          title: title,
          // lastModified: date,
          created: date,
        ).toEntity();
      } catch (e) {
        erro = e.toString();
      }

      expect(erro, isNotNull);
      erro = null;


      try {
        TaskModel(
          folderId: idFolder,
          title: title,
          lastModified: date,
          // created: date,
        ).toEntity();
      } catch (e) {
        erro = e.toString();
      }

      expect(erro, isNotNull);
    });
  });

  group('Testando método copyWith do FolderModel', () {
    testWidgets('Passando os dados no método', (tester) async {
      var id = faker.randomGenerator.integer(1000);
      var idFolder = faker.randomGenerator.integer(1000);
      var title = faker.lorem.word();
      var description = faker.lorem.sentence();
      var date = faker.date.dateTime();
      var date1 = faker.date.dateTime();
      var date2 = faker.date.dateTime();
      var completed = faker.randomGenerator.boolean();

      var folder = TaskModel(
        id: id,
        folderId: idFolder,
        title: title,
        description: description,
        created: date,
        lastModified: date1,
        completedDate: date2,
        completed: completed,
      );

      expect(folder.id, id);
      expect(folder.folderId, idFolder);
      expect(folder.title, title);
      expect(folder.description, description);
      expect(folder.created, date);
      expect(folder.lastModified, date1);
      expect(folder.completedDate, date2);
      expect(folder.completed, completed);

      folder = folder.copyWith();

      expect(folder.id, id);
      expect(folder.folderId, idFolder);
      expect(folder.title, title);
      expect(folder.description, description);
      expect(folder.created, date);
      expect(folder.lastModified, date1);
      expect(folder.completedDate, date2);
      expect(folder.completed, completed);

      id = faker.randomGenerator.integer(1000);
      idFolder = faker.randomGenerator.integer(1000);
      title = faker.lorem.word();
      description = faker.lorem.sentence();
      date = faker.date.dateTime();
      date1 = faker.date.dateTime();
      date2 = faker.date.dateTime();
      completed = faker.randomGenerator.boolean();

      folder = folder.copyWith(
        id: id,
        folderId: idFolder,
        title: title,
        description: description,
        created: date,
        lastModified: date1,
        completedDate: date2,
        completed: completed,
      );

      expect(folder.id, id);
      expect(folder.folderId, idFolder);
      expect(folder.title, title);
      expect(folder.description, description);
      expect(folder.created, date);
      expect(folder.lastModified, date1);
      expect(folder.completedDate, date2);
      expect(folder.completed, completed);
    });

    testWidgets('Testando método copyWith para remoção do completedDate', (tester) async {
      final idFolder = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final date = faker.date.dateTime();
      final zero = DateTime(0);

      final folder = TaskModel(
        folderId: idFolder,
        title: title,
        completedDate: date,
        lastModified: date,
        created: date,
      );

      final copyWith = folder.copyWith(
        completedDate: zero,
        lastModified: zero,
        created: zero,
      );

      expect(copyWith.completedDate, isNull);
      expect(copyWith.lastModified, zero);
      expect(copyWith.created, zero);
    });
  });

  test('Testando método toString', () {
    final id = faker.randomGenerator.integer(1000);
    final idFolder = faker.randomGenerator.integer(1000);
    final title = faker.lorem.word();
    final description = faker.lorem.sentence();
    final date = faker.date.dateTime();
    final date1 = faker.date.dateTime();
    final date2 = faker.date.dateTime();
    final completed = faker.randomGenerator.boolean();

    final folder = TaskModel(
      id: id,
      folderId: idFolder,
      title: title,
      description: description,
      created: date,
      lastModified: date1,
      completedDate: date2,
      completed: completed,
    ).toString();

    expect(folder.contains(id.toString()), isTrue);
    expect(folder.contains(idFolder.toString()), isTrue);
    expect(folder.contains(title), isTrue);
    expect(folder.contains(description), isTrue);
    expect(folder.contains(date.toString()), isTrue);
    expect(folder.contains(date1.toString()), isTrue);
    expect(folder.contains(date2.toString()), isTrue);
    expect(folder.contains(completed.toString()), isTrue);
  });
}
