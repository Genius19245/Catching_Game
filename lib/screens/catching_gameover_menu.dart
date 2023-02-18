import 'package:catching_game/screens/character_choosing.dart';
import 'package:flutter/material.dart';
import '../Game/catching.dart';
import 'catching_instructions.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({
    super.key,
    required this.game,
  });
  final CatchingGame game;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.black38,
      child: Center(
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: height * .15),
                const Text(
                  'Game Over!',
                  style: TextStyle(fontSize: 56, color: Colors.orangeAccent),
                ),
                Table(
                  // border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(.2),
                    1: FlexColumnWidth(.5),
                    2: FlexColumnWidth(.2),
                    3: FlexColumnWidth(.1),
                  },
                  children: [
                    TableRow(
                      children: [
                        const SizedBox(),
                        const Text(
                          'Score: ',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 34),
                        ),
                        Text(
                          game.score.value.toString(),
                          style: const TextStyle(
                              color: Colors.orangeAccent, fontSize: 34),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    game
                      ..reset()
                      ..resumeEngine()
                      ..overlays.remove('GameOverMenu');
                    Navigator.of(context)
                        .pushReplacement(CatchingGameInstructions.route());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    height: 75,
                    width: 200,
                    child: const Center(
                        child: Text('Try Again',
                            style:
                                TextStyle(fontSize: 34, color: Colors.white))),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(CharacterChoosing.route());
                    game.overlays.remove('GameOverMenu');
                  },
                  child: Container(
                    height: 75,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: const Center(
                      child: Text(
                        'menu',
                        style: TextStyle(fontSize: 34, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
