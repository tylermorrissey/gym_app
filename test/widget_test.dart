// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/main.dart';

void main() {
  testWidgets('BigCard test', (tester) async {
    final WordPair pair = WordPair('the', 'end');
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: BigCard(pair: pair))));

    expect(find.text('theend'), findsOneWidget);
  });
}
