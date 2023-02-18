import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'catching.dart';
import 'catching_character.dart';

enum FoodTypes {
  apple,
  burger,
  cake,
  candy,
  carrot,
  coke,
  brocolli,
  icecream,
}

// class Food extends SpriteComponent
//     with HasGameRef<CatchingGame>, CollisionCallbacks {
//   Food({super.sprite}) {
//     position = Vector2(100, 100);
//     size = Vector2(60, 60);
//     add(RectangleHitbox());
//     debugMode = true;
//   }
//   final _random = Random();
//   FoodTypes now = FoodTypes.apple;
//
//   @override
//   void update(double dt) {
//     y += 2;
//     if (y > gameRef.size.y + 10) {
//       y = -90;
//       _resetToRandomPosition();
//       randomiseType();
//     }
//
//     super.update(dt);
//   }
//
//   @override
//   void onCollisionStart(
//       Set<Vector2> intersectionPoints, PositionComponent other) {
//     if (other is CatchingGameCharacter) {
//       y = -50;
//       _resetToRandomPosition();
//       randomiseType();
//       detectCollisions();
//     }
//     super.onCollisionStart(intersectionPoints, other);
//   }
//
//   void _resetToRandomPosition() {
//     final halfWidth = size.x / 1.5;
//     x = halfWidth +
//         (_random.nextDouble() * (gameRef.size.x - halfWidth)) -
//         size.y;
//   }
//
//   void randomiseType() {
//     final random = _random.nextInt(11) + 1;
//     if (random == 1 || random == 11) {
//       now = FoodTypes.apple;
//     }
//     if (random == 2) {
//       now = FoodTypes.burger;
//     }
//     if (random == 3) {
//       now = FoodTypes.cake;
//     }
//     if (random == 4) {
//       now = FoodTypes.candy;
//     }
//     if (random == 5) {
//       now = FoodTypes.apple;
//     }
//     if (random == 6) {
//       now = FoodTypes.chips;
//     }
//     if (random == 7) {
//       now = FoodTypes.lolli;
//     }
//     if (random == 8) {
//       now = FoodTypes.peas;
//     }
//     if (random == 9) {
//       now = FoodTypes.tomato;
//     }
//     if (random == 10) {
//       now = FoodTypes.tomato;
//     }
//   }
//
//   void detectCollisions() {
//     if (now == FoodTypes.apple) {
//       gameRef.score.value += 1;
//       AudioManager.playSfx('coin.mp3');
//     }
//     if (now == FoodTypes.tomato) {
//       gameRef.score.value += 1;
//       AudioManager.playSfx('coin.mp3');
//     }
//     if (now == FoodTypes.chips) {
//       gameRef.score.value -= 1;
//       gameRef.health.value -= 1;
//       AudioManager.playSfx('hit.mp3');
//     }
//     if (now == FoodTypes.cake) {
//       gameRef.score.value -= 1;
//       gameRef.health.value -= 1;
//       AudioManager.playSfx('hit.mp3');
//     }
//     if (now == FoodTypes.peas) {
//       gameRef.score.value += 1;
//       AudioManager.playSfx('coin.mp3');
//     }
//     if (now == FoodTypes.lolli) {
//       gameRef.score.value -= 1;
//       gameRef.health.value -= 1;
//       AudioManager.playSfx('hit.mp3');
//     }
//   }
// }

class Food extends SpriteComponent
    with HasGameRef<CatchingGame>, CollisionCallbacks {
  Food({super.sprite}) {
    position = Vector2(79, -10);
    size = Vector2(65, 70);
    add(RectangleHitbox());
  }
  final _random = Random();
  FoodTypes now = FoodTypes.apple;

  @override
  void update(double dt) {
    y += 4;
    if (y > gameRef.size.y + 10) {
      _resetToRandomPosition();
      randomiseType();
      print(now.toString());
      gameRef.imageChanger();
      y = -75;
    }
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is CatchingGameCharacter) {
      detectCollision();
      y = -50;
      _resetToRandomPosition();
      randomiseType();
      gameRef.imageChanger();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  void _resetToRandomPosition() {
    final halfWidth = size.x / 1.5;

    x = halfWidth +
        (_random.nextDouble() * (gameRef.size.x - halfWidth)) -
        size.y;
  }

  void randomiseType() {
    final random = _random.nextInt(FoodTypes.values.length) + 1;
    if (random == 1) {
      now = FoodTypes.apple;
    }
    if (random == 2) {
      now = FoodTypes.burger;
    }
    if (random == 3) {
      now = FoodTypes.cake;
    }
    if (random == 4) {
      now = FoodTypes.candy;
    }
    if (random == 5) {
      now = FoodTypes.carrot;
    }
    if (random == 6) {
      now = FoodTypes.icecream;
    }
    if (random == 7) {
      now = FoodTypes.brocolli;
    }
    if (random == 8) {
      now = FoodTypes.coke;
    }
  }

  void detectCollision() {
    if (now == FoodTypes.apple) {
      gameRef.score.value += 1;
    }
    if (now == FoodTypes.burger) {
      gameRef.score.value -= 1;
      gameRef.health.value -= 1;
    }
    if (now == FoodTypes.carrot) {
      gameRef.score.value += 1;
    }
    if (now == FoodTypes.cake) {
      gameRef.score.value -= 1;
      gameRef.health.value -= 1;
    }
    if (now == FoodTypes.candy) {
      gameRef.score.value -= 1;
      gameRef.health.value -= 1;
    }
    if (now == FoodTypes.coke) {
      gameRef.score.value -= 1;
      gameRef.health.value -= 1;
    }
    if (now == FoodTypes.brocolli) {
      gameRef.score.value += 1;
    }
    if (now == FoodTypes.icecream) {
      gameRef.score.value -= 1;
      gameRef.health.value -= 1;
    }
  }
}
