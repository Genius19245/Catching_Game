import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'catching.dart';

enum PlayerCostume { blueBoy, RedBoy }

class CatchingGameCharacter extends SpriteComponent
    with HasGameRef<CatchingGame>, CollisionCallbacks {
  CatchingGameCharacter({super.sprite}) {
    add(RectangleHitbox());
    size = Vector2(100, 150);
  }
  double deltal = 0;
  var total = 0.0;

  @override
  Future<void> onLoad() async {
    x = gameRef.size.x / 2;
    y = gameRef.size.y - 240;
    super.onLoad();
  }

  @override
  void update(double dt) {
    deltal = dt;
    y = gameRef.size.y - 240;
    if (x > gameRef.size.x + 10) {
      x = 0;
    }
    if (x < -10) {
      x = gameRef.size.x + 9;
    }
    super.update(dt);
  }

  void onMoveMore() {
    total = deltal * (gameRef.size.x / 2) * 25;
    x += total;
  }

  void onMoveLess() {
    total = deltal * (gameRef.size.x / 2) * 25;
    x -= total;
  }
}
