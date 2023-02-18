import 'package:catching_game/Game/catching_character.dart';
import 'package:catching_game/screens/background_choosing.dart';
import 'package:catching_game/screens/catching_instructions.dart';
import 'package:flutter/material.dart';

late var selection;

class CharacterChoosing extends StatefulWidget {
  const CharacterChoosing({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const CharacterChoosing(),
    );
  }

  @override
  _CharacterChoosingState createState() => _CharacterChoosingState();
}

class _CharacterChoosingState extends State<CharacterChoosing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose your Character',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          ListView(
            children: [
              InkWell(
                onTap: () {
                  selection = PlayerCostume.RedBoy;
                  Navigator.of(context).push(CatchingGameInstructions.route());
                },
                child: Image.asset(
                  'assets/images/boy1.png',
                  height: 200,
                  width: 200,
                ),
              ),
              InkWell(
                onTap: () {
                  selection = PlayerCostume.blueBoy;
                  Navigator.of(context).push(CatchingGameInstructions.route());
                },
                child: Image.asset(
                  'assets/images/blueboy.png',
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
