import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/database.dart';
import 'package:gym_app/main.dart';

//Thought i was onto something here
// @riverpod
// class FakeDatabase extends _$FakeDatabase implements Database {
//   final firestore = FakeFirebaseFirestore();
//
//   @override
//   Stream build() {
//     Stream exercises = firestore.collection('exercises').snapshots();
//     return exercises;
//   }
//
//   @override
//   Future<bool> addExercise(String exercise) async {
//     try {
//       await firestore.collection('exercises').add({'exercise': exercise});
//       return true;
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
//
//   @override
//   Future<bool> removeExercise(String exercise) async {
//     try {
//       await firestore.collection('exercises').add({'exercise': exercise});
//       return true;
//     } catch (e) {
//       print(e);
//       return Future.error(e);
//     }
//   }
// }

const exerciseCollection = 'exercises';

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('shows messages', (tester) async {
      // Render the widget.

      await tester.pumpWidget(
        ProviderScope(
            // ProviderScopes have the exact same "overrides" parameter
            overrides: [
              // Same as before
              databaseProvider.overrideWith(() => Database()),
            ],
            child:
                const MaterialApp(title: 'Firestore Example', home: MyApp())),
      );
      // Let the snapshots stream fire a snapshot.
      await tester.idle();
      // Re-render.
      await tester.pump();
      // // Verify the output.
      expect(find.text('exercise'), findsOneWidget);
    });
  });
}
