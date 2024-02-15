import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/database.dart';

class HomePage extends ConsumerWidget {
  static String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exDb = ref.watch(databaseProvider.notifier).build();

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: StreamBuilder(
        stream: exDb,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available');
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data.docs[index].data();
                return ItemTile(
                  data['name'],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ItemTile extends ConsumerWidget {
  final String name;

  const ItemTile(this.name, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          name,
          key: Key('text_$name'),
        ),
        trailing: IconButton(
          key: Key('icon_$name'),
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            ref.watch(databaseProvider.notifier).removeExercise(name);
          },
        ),
      ),
    );
  }
}
