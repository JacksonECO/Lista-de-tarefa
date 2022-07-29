import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/view_models/folder_model.dart';
import 'package:faker/faker.dart';

void main() {
  final id = faker.randomGenerator.integer(1000);
  final title = faker.lorem.word();
  final description = faker.lorem.sentence();
  final date = faker.date.dateTime();
  late FolderModel folder;

  setUp(() {
    //* Inicio de cada teste
    folder = FolderModel(
      id: id,
      title: title,
      description: description,
      created: date,
    );
  });
  tearDown(() {}); //* Fim de cada teste
  group('Testando o Construtor do FolderModel', () {
    testWidgets('Garantir a criação de um FolderModel Simples', (tester) async {
      final folder = FolderModel(
        title: title,
      );
      expect(folder.title, title);
    });

    testWidgets('Garantir a criação de um  FolderModel com descrição vazia ""', (tester) async {
      final folder = FolderModel(
        title: title,
        description: '',
      );

      expect(folder.description, isNull);
    });

    testWidgets('Garantir erro ao criar um FolderModel com title vazio', (tester) async {
      expect(
          () => FolderModel(
                title: '',
              ),
          throwsAssertionError);
    });
  });

  group('Testando a integração com a Entity do FolderModel', () {
    testWidgets('Garantir o funcionamento do toEntity e do fromEntity', (tester) async {
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

    testWidgets('Garantir o funcionamento do toEntity com e sem data de criação', (tester) async {
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

  testWidgets('Garantindo o funcionamento correto do copyWith', (tester) async {
    final id2 = faker.randomGenerator.integer(1000);
    final title2 = faker.lorem.word();
    final description2 = faker.lorem.sentence();
    final date2 = faker.date.dateTime();

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

    final copyWith2 = copyWith.copyWith();

    expect(copyWith2.id, id2);
    expect(copyWith2.title, title2);
    expect(copyWith2.description, description2);
    expect(copyWith2.created, date2);
  });

  test('Garantindo o funcionamento correto do toString', () {
    final folderString = folder.toString();

    expect(folderString.contains(id.toString()), isTrue);
    expect(folderString.contains(title), isTrue);
    expect(folderString.contains(description), isTrue);
    expect(folderString.contains(date.toString()), isTrue);
  });
}
