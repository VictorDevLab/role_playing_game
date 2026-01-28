import 'package:flutter/material.dart';
import 'package:role_playing_game/screens/create/create.dart';
import 'package:role_playing_game/screens/home/home.dart';
import 'package:role_playing_game/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: const Create(),
    ),
  );
}
