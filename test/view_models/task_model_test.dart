import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/view_models/task_model.dart';

void main() {
  final id = faker.randomGenerator.integer(1000);
  final idFolder = faker.randomGenerator.integer(1000);
  final title = faker.lorem.word();
  final description = faker.lorem.sentence();
  final created = faker.date.dateTime();
  final lastModified = faker.date.dateTime();
  final completedDate = faker.date.dateTime();
  final completed = faker.randomGenerator.boolean();

  late TaskModel folder;

  setUp(() {
    folder = TaskModel(
      id: id,
      folderId: idFolder,
      title: title,
      description: description,
      created: created,
      lastModified: lastModified,
      completedDate: completedDate,
      completed: completed,
    );
  });

  group('Testando o Construtor do FolderModel', () {
    testWidgets('Garantindo a criação de um TaskModel Simples', (tester) async {
      final folder = TaskModel(
        folderId: idFolder,
        title: title,
      );

      expect(folder.folderId, idFolder);
      expect(folder.title, title);
    });

    testWidgets('Garantindo a criação de um FolderModel com descrição vazia ', (tester) async {
      final _folder = TaskModel(
        folderId: idFolder,
        title: title,
        description: '',
      );

      expect(_folder.description, isNull);
    });

    testWidgets('Garantindo a criação de um FolderModel com title vazio "" gere um erro', (tester) async {
      expect(
          () => TaskModel(
                folderId: idFolder,
                title: '',
              ),
          throwsAssertionError);
    });
  });

  group('Testando a integração com a Entity do FolderModel', () {
    testWidgets('Garantir o funcionamento do toEntity e fromEntity', (tester) async {
      final folderEntity = folder.toEntity();

      expect(folderEntity.id, id);
      expect(folderEntity.folderId, idFolder);
      expect(folderEntity.title, title);
      expect(folderEntity.description, description);
      expect(folderEntity.created, created);
      expect(folderEntity.lastModified, lastModified);
      expect(folderEntity.completedDate, completedDate);
      expect(folderEntity.completed, completed);

      final folderFromEntity = TaskModel.fromEntity(folderEntity);

      expect(folderFromEntity.id, id);
      expect(folderFromEntity.folderId, idFolder);
      expect(folderFromEntity.title, title);
      expect(folderFromEntity.description, description);
      expect(folderFromEntity.created, created);
      expect(folderFromEntity.lastModified, lastModified);
      expect(folderFromEntity.completedDate, completedDate);
      expect(folderFromEntity.completed, completed);
    });

    testWidgets('Garantir erro ao converter para Entity sem datas', (tester) async {
      var erro;

      try {
        TaskModel(
          folderId: idFolder,
          title: title,
          // lastModified: lastModified,
          created: created,
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
          lastModified: lastModified,
          // created: created,
        ).toEntity();
      } catch (e) {
        erro = e.toString();
      }

      expect(erro, isNotNull);
    });
  });

  group('Testando método copyWith do FolderModel', () {
    testWidgets('Garantir o funcionamento do copyWith padrão', (tester) async {
      final _id = faker.randomGenerator.integer(1000);
      final _idFolder = faker.randomGenerator.integer(1000);
      final _title = faker.lorem.word();
      final _description = faker.lorem.sentence();
      final _created = faker.date.dateTime();
      final _lastModified = faker.date.dateTime();
      final _completedDate = faker.date.dateTime();
      final _completed = faker.randomGenerator.boolean();

      var _folder = folder.copyWith(
        id: _id,
        folderId: _idFolder,
        title: _title,
        description: _description,
        created: _created,
        lastModified: _lastModified,
        completedDate: _completedDate,
        completed: _completed,
      );

      expect(_folder.id, _id);
      expect(_folder.folderId, _idFolder);
      expect(_folder.title, _title);
      expect(_folder.description, _description);
      expect(_folder.created, _created);
      expect(_folder.lastModified, _lastModified);
      expect(_folder.completedDate, _completedDate);
      expect(_folder.completed, _completed);

      _folder = _folder.copyWith();

      expect(_folder.id, _id);
      expect(_folder.folderId, _idFolder);
      expect(_folder.title, _title);
      expect(_folder.description, _description);
      expect(_folder.created, _created);
      expect(_folder.lastModified, _lastModified);
      expect(_folder.completedDate, _completedDate);
      expect(_folder.completed, _completed);
    });

    testWidgets('Garantir a remoção do completedDate usando o copyWith', (tester) async {
      final zero = DateTime(0);

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

  test('Garantir o funcionamento do toString', () {
    final folderString = folder.toString();

    expect(folderString.contains(id.toString()), isTrue);
    expect(folderString.contains(idFolder.toString()), isTrue);
    expect(folderString.contains(title), isTrue);
    expect(folderString.contains(description), isTrue);
    expect(folderString.contains(created.toString()), isTrue);
    expect(folderString.contains(lastModified.toString()), isTrue);
    expect(folderString.contains(completedDate.toString()), isTrue);
    expect(folderString.contains(completed.toString()), isTrue);
  });
}
