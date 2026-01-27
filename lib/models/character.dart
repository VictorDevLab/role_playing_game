import 'dart:ffi';

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
}

List<Character> characters = [
  Character(
    id: "1",
    name: "Klara",
    slogan: "Kumpuf",
    vocation: Vocation.wizard,
  ),
  Character(
    id: '2',
    name: 'Jonny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.',
  ),
];
