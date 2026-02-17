import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:role_playing_game/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection("characters")
      //to process data to and from firestore
      .withConverter(
        fromFirestore: Character.fromFireStore,
        toFirestore: (Character c, _) => c.toFireStore(),
      );
}
