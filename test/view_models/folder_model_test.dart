import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';
import 'package:faker/faker.dart';

void main() {
  group('Testando o Construtor do FolderModel', () {
    testWidgets('Criando FolderModel Simples', (tester) async {
      final id = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final description = faker.lorem.sentence();
      final date = faker.date.dateTime();

      final folder = FolderModel(
        id: id,
        title: title,
        description: description,
        created: date,
      );

      expect(folder.id, id);
      expect(folder.title, title);
      expect(folder.description, description);
      expect(folder.created, date);
    });

    testWidgets('Criando FolderModel com descrição vazia ""', (tester) async {
      final title = faker.lorem.word();

      final folder = FolderModel(
        title: title,
        description: '',
      );

      expect(folder.description, isNull);
    });

    testWidgets('Criando FolderModel com title vazio ""', (tester) async {
      expect(
          () => FolderModel(
                title: '',
              ),
          throwsAssertionError);
    });
  });

  group('Testando a integração com a Entity do FolderModel', () {
    testWidgets('Testando toEntity e fromEntity', (tester) async {
      final id = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final description = faker.lorem.sentence();
      final date = faker.date.dateTime();

      final folder = FolderModel(
        id: id,
        title: title,
        description: description,
        created: date,
      );

      final entity = folder.toEntity();

      expect(entity.id, id);
      expect(entity.title, title);
      expect(entity.description, description);
      expect(entity.created, date);

      final folderFromEntity = FolderModel.fromEntity(entity);

      expect(folderFromEntity.id, id);
      expect(folderFromEntity.title, title);
      expect(folderFromEntity.description, description);
      expect(folderFromEntity.created, date);
    });

    testWidgets('Convertendo para Entity com e sem data de criação', (tester) async {
      final title = faker.lorem.word();
      final date = faker.date.dateTime();
      var erro;

      try {
        FolderModel(
          title: title,
        ).toEntity();
      } catch (e) {
        erro = e;
      }

      expect(erro, isNotNull);
      erro = null;

      try {
        FolderModel(
          title: title,
          created: date,
        ).toEntity();
      } catch (e) {
        erro = e;
      }
      expect(erro, isNull);
    });
  });

  group('Testando método copyWith do FolderModel', () {
    testWidgets('Passando os dados no método', (tester) async {
      final id = faker.randomGenerator.integer(1000);
      final id2 = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final title2 = faker.lorem.word();
      final description = faker.lorem.sentence();
      final description2 = faker.lorem.sentence();
      final date = faker.date.dateTime();
      final date2 = faker.date.dateTime();

      final folder = FolderModel(
        id: id,
        title: title,
        description: description,
        created: date,
      );

      final copyWith = folder.copyWith(
        id: id2,
        title: title2,
        description: description2,
        created: date2,
      );

      expect(copyWith.id, id2);
      expect(copyWith.title, title2);
      expect(copyWith.description, description2);
      expect(copyWith.created, date2);
    });

    testWidgets('Testando método copyWith do FolderModel', (tester) async {
      final id = faker.randomGenerator.integer(1000);
      final title = faker.lorem.word();
      final description = faker.lorem.sentence();
      final date = faker.date.dateTime();

      final folder = FolderModel(
        id: id,
        title: title,
        description: description,
        created: date,
      );

      final copyWith = folder.copyWith();

      expect(copyWith.id, id);
      expect(copyWith.title, title);
      expect(copyWith.description, description);
      expect(copyWith.created, date);
    });
  });

  test('Testando método toString', () {
    final id = faker.randomGenerator.integer(1000);
    final title = faker.lorem.word();
    final description = faker.lorem.sentence();
    final date = faker.date.dateTime();

    final folder = FolderModel(
      id: id,
      title: title,
      description: description,
      created: date,
    ).toString();

    expect(folder.contains(id.toString()), isTrue);
    expect(folder.contains(title), isTrue);
    expect(folder.contains(description), isTrue);
    expect(folder.contains(date.toString()), isTrue);
  });
}
