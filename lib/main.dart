import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:role_playing_game/screens/create/create.dart';
import 'package:role_playing_game/screens/home/home.dart';
import 'package:role_playing_game/services/character_store.dart';
import 'package:role_playing_game/theme.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: primaryTheme,
        home: const Home(),
      ),
    ),
  );
}
