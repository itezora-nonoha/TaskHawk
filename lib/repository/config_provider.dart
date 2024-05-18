import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/models/user_config.dart';

final userConfigStreamProvider = StreamProvider<List<UserConfig>>((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final collection = FirebaseFirestore.instance
      .collection('user_config')
      .where('uid', isEqualTo: uid);

  final stream = collection.snapshots().map(
        (e) => e.docs.map((e) => UserConfig.fromJson(e.data())).toList(),
      );
  return stream;
});
