import 'package:flame/components.dart';
import 'package:flame_alarm_game/game/memory_game.dart';
import 'package:flutter/foundation.dart';

@immutable
class MemoryCardFace {
  factory MemoryCardFace.fromInt(int index) {
    assert(index >= 0 && index <= 9);
    return _singletons[index];
  }

  MemoryCardFace._(double x, double y, double w, double h)
    : sprite = memoryGameSprite(x, y, w, h);

  final Sprite sprite;

  static final List<MemoryCardFace> _singletons = List.generate(
    9,
    (i) => MemoryCardFace._(
      (i % 3) * MemoryGame.cardWidth,
      (i ~/ 3) * MemoryGame.cardHeight,
      MemoryGame.cardWidth,
      MemoryGame.cardHeight,
    ),
  );
}
