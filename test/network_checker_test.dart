import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:network_checker/network_checker.dart';

void main() {
  testWidgets('checkConnection test', (WidgetTester tester) async {
    NetworkChecker networkChecker = NetworkChecker();

    // Test when there is a valid internet connection
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          networkChecker.checkConnection(
            context,
            'example.com',
            MaterialPageRoute(builder: (context) => Container()),
          );
          return Container();
        },
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('No Internet Connection'), findsNothing);

    // Test when there is no internet connection
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          networkChecker.checkConnection(
            context,
            'nonexistenturl',
            MaterialPageRoute(builder: (context) => Container()),
          );
          return Container();
        },
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('No Internet Connection'), findsOneWidget);
  });
}
