import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_alarm_game/game/components/memory_card.dart';

class MemoryGame extends FlameGame {
  static const double cardWidth = 1024.0;
  static const double cardHeight = 559.0;
  static const cardGap = 175.0;
  static const cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.load('memory-game-sprite.png');

    final memoryCards = List.generate(
      16,
      (i) => MemoryCard()
              ..size = cardSize
              ..position = Vector2(
                cardGap + i % 4 * (cardGap + cardWidth),
                cardGap + (i ~/ 4) * (cardGap + cardHeight) 
              )
    );

    world.addAll(memoryCards);
    camera.viewfinder.visibleGameSize = Vector2(
      (5*cardGap + 4*cardWidth),
      (5*cardGap + 4*cardHeight)
    );

    camera.viewfinder.position = Vector2(
      (2.5*cardGap + 2*cardWidth),
      (2.5*cardGap + 2*cardHeight)
    );

    camera.viewfinder.anchor = Anchor.center;
  
  }
}

Sprite memoryGameSprite(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('memory-game-sprite.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}