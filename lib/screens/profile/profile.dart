import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:role_playing_game/models/character.dart';
import 'package:role_playing_game/screens/profile/skill_list.dart';
import 'package:role_playing_game/screens/profile/stats_table.dart';
import 'package:role_playing_game/services/character_store.dart';
import 'package:role_playing_game/shared/styled_button.dart';
import 'package:role_playing_game/shared/styled_text.dart';
import 'package:role_playing_game/theme.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //basic info - Image vocation description.
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.name),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //weapon, ability and slogan
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Container(
                //takes up all the available width,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading("Weapon of choice"),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading("Unique Ability"),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            //stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            //save button
            StyledButton(
              onPressed: () {
                // update in db
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).saveCharacter(character);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const StyledHeading("Character was saved"),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 3),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                );
              },
              child: StyledHeading("Save Character"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
