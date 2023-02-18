import 'package:flutter/material.dart';

import 'catching_game.dart';

class CatchingGameInstructions extends StatefulWidget {
  const CatchingGameInstructions({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const CatchingGameInstructions(),
    );
  }

  @override
  _CatchingGameInstructionsState createState() =>
      _CatchingGameInstructionsState();
}

class _CatchingGameInstructionsState extends State<CatchingGameInstructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset('assets/images/stars.png')],
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 34,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        backgroundColor: const Color.fromRGBO(129, 191, 232, 1),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 35,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(56),
                ),
                height: 520,
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 30,
                      ),
                      child: Text(
                        'Catching Game',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Collect as many as healthy foods vegetables as'
                        ' possible '
                        ' to score points and dodge the unhealthy '
                        'food otherwise '
                        'you will lose health .'
                        ' press Arrow Keys  to move the  player. You have Ten '
                        'lives.Good Luck!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(CatchingGameScreen.route());
                      },
                      child: Container(
                        height: 75,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39),
                          color: Colors.orangeAccent,
                        ),
                        child: const Center(
                          child: Text(
                            'Start',
                            style: TextStyle(color: Colors.white, fontSize: 39),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Image.asset(
              'assets/images/icecream.png',
              height: 85,
              width: 85,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Image.asset(
              'assets/images/broccoli.png',
              height: 85,
              width: 85,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
