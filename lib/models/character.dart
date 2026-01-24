import 'package:role_playing_game/models/stats.dart';

class Character with Stats {
  //Constructor
  Character({required this.name, required this.slogan, required this.id});

  //fields
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
}
