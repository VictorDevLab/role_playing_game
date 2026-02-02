import 'package:flutter/material.dart';
import 'package:role_playing_game/models/vocation.dart';
import 'package:role_playing_game/screens/create/vocation_card.dart';
import 'package:role_playing_game/shared/styled_button.dart';
import 'package:role_playing_game/shared/styled_text.dart';
import 'package:role_playing_game/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    //set state triggers a rebuild
    setState(() {
      selectedVocation = vocation;
    });
  }

  //submit handler function
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print("Character Name cannot be empty");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("Character Name cannot be empty");
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading("Welcome New Player!")),
              const Center(
                child: StyledText("Create a name & Slogan for your character"),
              ),
              const SizedBox(height: 30),

              //inputs for name and slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Character Name"),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character Slogan"),
                ),
              ),
              const SizedBox(height: 30),
              //selecting a vocation
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading("Choose a vocation!")),
              const Center(
                child: StyledText("Determines your available skills"),
              ),
              const SizedBox(height: 30),

              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledText("Create Character"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
