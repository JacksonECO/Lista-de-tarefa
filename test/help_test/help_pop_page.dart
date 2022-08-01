import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: must_be_immutable
class HelpPopPage extends StatelessWidget {
  static const pageKey = Key('PopValuePageTest');
  dynamic _value;

  final Widget child;
  HelpPopPage({required this.child, super.key});

  dynamic get value => this._value;
  Finder get finder => find.byKey(pageKey);
  
  Future<void> tap(WidgetTester tester) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  static Future<HelpPopPage> pumpWidget({
    required WidgetTester tester,
    required Widget child,
    NavigatorObserver? navigator,
  }) async {
    var screen = HelpPopPage(child: child);

    await tester.pumpWidget(MaterialApp(
      home: screen,
      navigatorObservers: [navigator ?? NavigatorObserver()],
    ));
    await screen.tap(tester);

    return screen;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: InkWell(
          key: pageKey,
          onTap: () async {
            _value = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => child),
            );
          },
        ),
      );
}
