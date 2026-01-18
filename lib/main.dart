

import 'package:flame/game.dart';
import 'package:flame_alarm_game/game/memory_game.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final game = MemoryGame();
  runApp(GameWidget(game: game));
}