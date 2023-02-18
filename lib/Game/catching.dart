import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'catching_background.dart';
import 'catching_character.dart';
import 'food.dart';

class CatchingGame extends FlameGame
    with HasDraggableComponents, HasCollisionDetection {
  CatchingGame() {}
  late CatchingGameCharacter character;
  bool gamerestart = false;

  late CatchingGameBackground background;
  String foodimg = 'apple.png';
  String foodimgs = 'apple.png';

  final score = ValueNotifier<int>(0);
  final health = ValueNotifier<int>(10);
  var healthHud = SpriteComponent();

  final _scoreText = TextComponent();
  final _healthText = TextComponent();
  late Food food;

  @override
  Future<void> onLoad() async {
    // AudioManager.init();z
    // await AudioManager.playMusic('synth.mp3', 'never_still.mp3');
    add(background =
        CatchingGameBackground(sprite: await loadSprite('background.png')));
    add(
      character = CatchingGameCharacter(sprite: await loadSprite('boy1.png')),
    );
    add(food = Food(sprite: await loadSprite('apple.png')));

    add(
      _scoreText
        ..size = Vector2(75.5, 75.5)
        ..position = Vector2(15, 26),
    );
    score.addListener(_updateScoreText);
    _updateScoreText();

    // Add health display
    add(
      _healthText
        ..size = Vector2(75.5, 75.5)
        ..position = Vector2(size.x - 26.0, 26)
        ..anchor = Anchor.topRight,
    );
    health.addListener(_updateHealthText);
    _updateHealthText();
    add(
      healthHud = SpriteComponent(
          sprite: await loadSprite('heart.png'), size: Vector2(40, 40)),
    );

    super.onLoad();
  }

  void _updateHealthText() {
    _healthText.text = ' ${health.value}';
  }

  void _updateScoreText() {
    _scoreText.text = 'Score: ${score.value}';
  }

  @override
  Future<void> update(double dt) async {
    healthHud
      ..y = _healthText.y
      ..x = _healthText.x - 70;
    if (health.value == 0) {
      gamerestart = true;
      pauseEngine();
      overlays.add('GameOverMenu');
      if (food.y > size.y + 10) {
        imageChanger();
      }
    }
    if (score.value == -1) {
      score.value = 0;
    }
    _healthText.position = Vector2(size.x - 26.0, 26);
    imageChanger();

    food.sprite = await loadSprite(foodimg);

    imageChanger();

    food.sprite = await loadSprite(foodimg);
    print(foodimg);
    super.update(dt);
  }

  void reset() {
    _scoreText
      ..size = Vector2(75.5, 75.5)
      ..position = Vector2(15, 26)
      ..text = 'Score: 0';
    _healthText
      ..size = Vector2(75.5, 75.5)
      ..position = Vector2(size.x - 26.0, 26)
      ..anchor = Anchor.topRight;
    score.value = 0;
    health.value = 10;
    gamerestart = false;
    overlays.remove('GameOverMenu');
  }

  void imageChanger() {
    if (food.now == FoodTypes.apple) {
      foodimg = 'apple.png';
    }

    if (food.now == FoodTypes.carrot) {
      foodimg = 'carrot.png';
    }

    if (food.now == FoodTypes.cake) {
      foodimg = 'cake.png';
    }
    if (food.now == FoodTypes.burger) {
      foodimg = 'burger.png';
    }
    if (food.now == FoodTypes.candy) {
      foodimg = 'candy.png';
    }
    if (food.now == FoodTypes.brocolli) {
      foodimg = 'broccoli.png';
    }
    if (food.now == FoodTypes.icecream) {
      foodimg = 'icecream.png';
    }
    if (food.now == FoodTypes.coke) {
      foodimg = 'coke.png';
    }
  }
}
