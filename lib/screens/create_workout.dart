import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateWorkout extends ConsumerWidget {
  const CreateWorkout({super.key});

  static String routeName = 'create_workout_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Workout')),
      body: CreateWorkoutFields(),
    );
  }
}

class CreateWorkoutFields extends HookConsumerWidget {
  const CreateWorkoutFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseText = useState('');
    final database = ref.watch(databaseProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => exerciseText.value = value,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name of Workout',
            ),
            key: Key('workoutInput'),
          ),
          const SizedBox(height: 12.0),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    database.addWorkout(exerciseText.value);
                  },
                  child: const Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
