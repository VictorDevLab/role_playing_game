mixin Stats {
  int _points = 10;
  int _health = 10;
  int _defense = 10;
  int _attack = 10;
  int _skill = 10;

  //getters
  int get points => _points;
  //returning stats as a map
  Map<String, int> get statsAsMap => {
    "health": _health,
    "defense": _defense,
    "attack": _attack,
    "skill": _skill,
  };

  List<Map<String, String>> get statsAsFormattedList => [
    {"title": "health", "value": _health.toString()},
    {"title": "defense", "value": _defense.toString()},
    {"title": "attack", "value": _attack.toString()},
    {"title": "skill", "value": _skill.toString()},
  ];

  //methods
  void increaseStats(String stat) {
    if (_points > 0) {
      if (stat == "health") {
        _health++;
      }
      if (stat == "defense") {
        _defense++;
      }
      if (stat == "attack") {
        _attack++;
      }
      if (stat == "skill") {
        _skill++;
      }
    }
  }

  void decreaseStats(String stat) {
    if (stat == "health" && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == "defense" && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == "attack" && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == "skill" && _skill > 5) {
      _skill--;
      _points++;
    }
  }
}
