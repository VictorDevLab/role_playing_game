import 'package:flutter/material.dart';
import 'package:role_playing_game/models/character.dart';
import 'package:role_playing_game/shared/styled_text.dart';
import 'package:role_playing_game/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.points > 0
                      ? Colors.yellow
                      : Colors.grey,
                ),
                const SizedBox(width: 20),
                const StyledText("Stat Points available: "),
                const Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
