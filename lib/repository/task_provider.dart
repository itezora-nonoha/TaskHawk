import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/models/task.dart';

final taskStreamProvider = StreamProvider<List<Task>>((ref) {
  final collection = FirebaseFirestore.instance.collection('tasks');
  
  final stream = collection.snapshots().map(
       
        (e) => e.docs.map((e) => Task.fromJson(e.data())).toList(),
      );
  return stream;
});
