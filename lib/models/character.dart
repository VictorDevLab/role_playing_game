class Character {
  //Constructor
  Character({required this.name, required this.slogan, required this.id});

  //fields
  final String name;
  final String slogan;
  final String id;
  //the underscore means the variable is private
  bool _isFav = false;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}
