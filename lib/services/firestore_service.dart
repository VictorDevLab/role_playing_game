import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:role_playing_game/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection("characters")
      .withConverter(
        fromFirestore: Character.fromFireStore,
        toFirestore: (Character c, _) => c.toFireStore(),
      );
}
