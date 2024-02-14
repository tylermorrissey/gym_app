import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise.g.dart';

@riverpod
class Exercises extends _$Exercises {
  @override
  List<String> build() {
    final List<String> exercise = [];
    return exercise;
  }

  void add(String name) {
    state.add(name);
    print(state);
  }

  void remove(String name) {
    state.remove(name);
  }
}
