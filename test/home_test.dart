import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/database.dart';
import 'package:gym_app/main.dart';

// Widget createHomeScreen() => ConsumerWidget(
//       child: const MaterialApp(
//         home: HomePage(),
//       ),
//     );

const exerciseCollection = 'exercises';

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('shows messages', (tester) async {
      // Populate the fake database.
      final db = await DatabaseHelper().createDatabase();

      // Render the widget.

      await tester.pumpWidget(
        ProviderScope(
            // ProviderScopes have the exact same "overrides" parameter
            overrides: [
              // Same as before
              databaseProvider.overrideWith(),
            ],
            child:
                const MaterialApp(title: 'Firestore Example', home: MyApp())),
      );
      // Let the snapshots stream fire a snapshot.
      await tester.idle();
      // Re-render.
      await tester.pump();
      // // Verify the output.
      expect(find.text('Hello world!'), findsOneWidget);
      expect(find.text('Message 1 of 1'), findsOneWidget);
    });
  });
}
