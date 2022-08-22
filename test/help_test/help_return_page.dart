import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: must_be_immutable
class HelpReturnPage extends StatelessWidget {
  static const pageKey = Key('ReturnValuePageTest');
  dynamic value;

  final Widget child;
  final WidgetTester tester;
  HelpReturnPage({required this.child, required this.tester, this.value, super.key});

  Finder get finder => find.byKey(pageKey);

  Future<void> tapPop() async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  get nextRoute => MaterialPageRoute(
          builder: HelpReturnPage(
        child: child,
        tester: tester,
        value: value,
      ).build);

  static Future<HelpReturnPage> pumpWidget({
    required WidgetTester tester,
    required Widget child,
    required String namePage,
    dynamic value = true,
    NavigatorObserver? navigator,
  }) async {
    var screenHelp = HelpReturnPage(child: child, tester: tester, value: value);

    await tester.pumpWidget(MaterialApp(
      home: child,
      navigatorObservers: [navigator ?? NavigatorObserver()],
      routes: {
        namePage: (context) => screenHelp,
      },
    ));

    return screenHelp;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: InkWell(
          key: pageKey,
          onTap: () async {
            Navigator.pop(context, value);
          },
        ),
      );
}
