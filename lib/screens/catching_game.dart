import 'package:flame/game.dart' show GameWidget;
import 'package:flutter/material.dart';

import '../Game/catching.dart';
import 'catching_gameover_menu.dart';

CatchingGame game = CatchingGame();

class CatchingGameScreen extends StatefulWidget {
  const CatchingGameScreen({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const CatchingGameScreen(),
    );
  }

  @override
  _CatchingGameScreenState createState() => _CatchingGameScreenState();
}

class _CatchingGameScreenState extends State<CatchingGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          GameWidget(game: game, overlayBuilderMap: {
            'GameOverMenu': (context, CatchingGame games) {
              return GameOverMenu(game: game);
            }
          }),
          Column(
            children: [
              if (game.gamerestart)
                const Text(
                  '',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.of(context).pushReplacement(SplashScreen.route());
              //     game.reset();
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.orange,
              //         borderRadius: BorderRadius.circular(24),
              //       ),
              //       height: 50,
              //       width: 100,
              //       child: const Center(
              //         child: Text(
              //           'Replay',
              //           style: TextStyle(fontSize: 25, color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                game.character.onMoveLess();
              },
              child: Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  'assets/images/right.png',
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (_) {
                  game.character.onMoveMore();
                },
                onTapUp: (_) {
                  game.character.x += 0;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/images/left.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
