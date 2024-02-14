import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/exercise.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_exercise.g.dart';

@riverpod
class ExerciseText extends _$ExerciseText {
  @override
  String build() => '';

  void changeText(String text) {
    state = text;
    print(state);
  }
}

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

class CreateExerciseFields extends ConsumerWidget {
  const CreateExerciseFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(exerciseTextProvider.notifier);
    final textToSave = ref.watch(exerciseTextProvider);
    final exerciseAdd = ref.watch(exercisesProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => text.changeText(value),
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
                    exerciseAdd.add(textToSave);
                    print(textToSave);
                  },
                  child: const Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
