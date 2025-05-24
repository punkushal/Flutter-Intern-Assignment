import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_intern_assignment/data/models/music_model.dart';

class MusicServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collection = 'music_services';

  Future<List<MusicModel>> getAllServices() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(_collection).orderBy('order').get();
      return querySnapshot.docs
          .map(
            (doc) => MusicModel.fromFirestore(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }
}
