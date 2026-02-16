import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:role_playing_game/models/skill.dart';
import 'package:role_playing_game/models/stats.dart';
import 'package:role_playing_game/models/vocation.dart';

class Character with Stats {
  //Constructor
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  //fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  //the underscore means the variable is private
  bool _isFav = false;

  //getters
  bool get isFav => _isFav;

  //methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  //character to firestore(Saving character as a map)//(Serialization)
  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  //character from firestore(deserialize)
  factory Character.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    //1st) Get data form the snapshot;
    final data = snapshot.data()!;
    //2nd)Make character instance
    Character character = Character(
      id: snapshot.id,
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
    );
    //update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == id);
      character.updateSkill(skill);
    }
    //set is fav
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }
    //assign stats and points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}
