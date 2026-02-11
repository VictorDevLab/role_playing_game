import 'package:flutter/material.dart';
import 'package:role_playing_game/models/character.dart';
import 'package:role_playing_game/models/skill.dart';
import 'package:role_playing_game/shared/styled_text.dart';
import 'package:role_playing_game/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;
  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSKills;

  @override
  void initState() {
    availableSKills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            StyledHeading("Choose an active skill"),
            StyledText('Skills are unique to your vocation'),
            const SizedBox(height: 20),
            Row(
              children: availableSKills.map((skill) {
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(2),
                  child: Image.asset(
                    'assets/img/skills/${skill.image}',
                    width: 70,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
