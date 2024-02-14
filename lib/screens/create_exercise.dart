import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/exercise.dart';

class CreateExercise extends ConsumerWidget {
  const CreateExercise({super.key});

  static String routeName = 'create_exercise_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Exercise')),
      body: CreateExerciseFields(),
    );
  }
}

class CreateExerciseFields extends HookConsumerWidget {
  const CreateExerciseFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseText = useState('');
    final exerciseAdd = ref.watch(exercisesProvider.notifier);
    final database = ref.watch(databaseProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => exerciseText.value = value,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name of Exercise',
            ),
          ),
          const SizedBox(height: 12.0),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    exerciseAdd.add(exerciseText.value);
                    database.addExercise(exerciseText.value);
                    print(exerciseText.value);
                  },
                  child: const Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
