import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:role_playing_game/models/character.dart';
import 'package:role_playing_game/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
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

  //getter
  get characters => _characters;

  //add character
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
