import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/screens/create_exercise.dart';

import 'mock.dart';

void main() {
  group('create exercise tests', () {
    testWidgets('shows submit button', (tester) async {
      setupFirebaseAuthMocks();
      await Firebase.initializeApp();
      await tester.pumpWidget(
          ProviderScope(child: const MaterialApp(home: CreateExercise())));

      // await tester.tap(find.text('submit'));

      expect(find.text('Submit'), findsOneWidget);
    });
  });
}
