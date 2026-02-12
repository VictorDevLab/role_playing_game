import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:role_playing_game/models/character.dart';
import 'package:role_playing_game/screens/create/create.dart';
import 'package:role_playing_game/screens/home/character_card.dart';
import 'package:role_playing_game/services/character_store.dart';
import 'package:role_playing_game/shared/styled_button.dart';
import 'package:role_playing_game/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Your Characters"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return CharacterCard(value.characters[index]);
                    },
                  );
                },
              ),
            ),

            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const CreateScreen()),
                );
              },
              child: StyledHeading("Create New"),
            ),
          ],
        ),
      ),
    );
  }
}
