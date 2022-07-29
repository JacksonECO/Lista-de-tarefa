import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefa/app_module.dart';
import 'package:lista_de_tarefa/main.dart';
import 'package:lista_de_tarefa/module/folder/folder_page.dart';

void main() {
  testWidgets('Garantir inicialização do aplicativo', (tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );

    await tester.pump();
    await tester.pump();
    await tester.pump();

    final screenHome = find.byType(FolderPage);
    expect(screenHome, findsOneWidget);
    final title = find.text('Listas');
    expect(title, findsOneWidget);
    final addFolderButton = find.byType(FloatingActionButton);
    expect(addFolderButton, findsOneWidget);
  });
}
