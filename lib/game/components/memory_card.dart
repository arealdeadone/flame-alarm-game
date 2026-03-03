import 'package:flame/components.dart';
import 'package:flame_alarm_game/game/components/memory_card_face.dart';
import 'package:flame_alarm_game/game/memory_game.dart';
import 'package:flutter/material.dart';

class MemoryCard extends PositionComponent {
  final MemoryCardFace memoryCardFace;
  static final Paint backgroundPaint = Paint()..color = const Color(0xff380c02);
  static final Paint borderPaint = Paint()
    ..color = const Color(0xffdbaf58)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;
  static final Paint borderPaint2 = Paint()
    ..color = const Color(0x5cef971b)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 35;
  static final RRect backRRectInner = memoryCardRect.deflate(40);
  static final RRect memoryCardRect = RRect.fromRectAndRadius(
    MemoryGame.cardSize.toRect(),
    const Radius.circular(0),
  );

  MemoryCard(int intMemoryCardFace)
    : memoryCardFace = MemoryCardFace.fromInt(intMemoryCardFace),
      super(size: MemoryGame.cardSize);

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(memoryCardRect, backgroundPaint);
    canvas.drawRRect(memoryCardRect, borderPaint);
    memoryCardFace.sprite.render(
      canvas,
    );
  }
}
