import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@riverpod
class Database extends _$Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _exercises;

  @override
  Stream build() {
    Stream exercises = _firestore.collection('exercises').snapshots();
    return exercises;
  }

  Future<bool> addExercise(String exercise) async {
    _exercises = _firestore.collection('exercises');
    try {
      await _exercises.add({
        'exercise': exercise,
      });
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> removeExercise(String exercise) async {
    _exercises = _firestore.collection('exercises');
    try {
      await _exercises.doc(exercise).delete();
      return true;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
