import 'package:role_playing_game/models/skill.dart';
import 'package:role_playing_game/models/stats.dart';
import 'package:role_playing_game/models/vocation.dart';

class Character with Stats {
  //Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
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
