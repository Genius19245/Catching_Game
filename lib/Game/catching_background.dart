import 'package:flame/components.dart';
import 'catching.dart';

class CatchingGameBackground extends SpriteComponent
    with HasGameRef<CatchingGame> {
  CatchingGameBackground({super.sprite});
  @override
  void update(double dt) {
    size = Vector2(gameRef.size.x, gameRef.size.y);
    super.update(dt);
  }
}
