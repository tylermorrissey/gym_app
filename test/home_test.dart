import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/screens/home.dart';

import 'mock.dart';

void main() {
  group('home page tests', () {
    setUpAll(() => firebaseMocks());
    testWidgets('screen renders correctly', (tester) async {
      // final instance = FakeFirebaseFirestore();
      //TODO get firestore add working
      await tester.pumpWidget(ProviderScope(
        child: const MaterialApp(home: HomePage()),
        // overrides: [databaseProvider.overrideWithProvider(override)],
      ));
      // await instance.collection('exercises').doc('generic').set({
      //   'name': 'generic',
      // });
      //
      await tester.idle();

      expect(find.text('Exercise List'), findsOneWidget);
    });
  });
}

void firebaseMocks() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
}
