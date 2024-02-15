import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise.g.dart';

//TODO Kind of worthless
@riverpod
class Exercises extends _$Exercises {
  @override
  List<String> build() {
    final List<String> exercise = [];
    return exercise;
  }

  Object list() {
    return state;
  }

  void add(String name) {
    state.add(name);
  }

  void remove(String name) {
    state.remove(name);
  }
}
