import 'package:catching_game/screens/character_choosing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatchingGameAppScreen());
}

class CatchingGameAppScreen extends StatelessWidget {
  const CatchingGameAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CharacterChoosing(),
    );
  }
}
