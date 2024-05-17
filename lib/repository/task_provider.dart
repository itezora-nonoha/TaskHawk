import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/models/task.dart';

final taskStreamProvider = StreamProvider<List<Task>>((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final collection = FirebaseFirestore.instance
      .collection('tasks')
      .where('createUser', isEqualTo: uid);

  final stream = collection.snapshots().map(
        (e) => e.docs.map((e) => Task.fromJson(e.data())).toList(),
      );
  return stream;
});
