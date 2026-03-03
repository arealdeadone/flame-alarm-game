# PROJECT KNOWLEDGE BASE

**Generated:** 2026-03-03
**Commit:** eb8cff0
**Branch:** main

## OVERVIEW

Flutter/Dart 2D memory card game using Flame engine (v1.34.0). Cross-platform: Android, iOS, macOS, Windows, Linux, Web. Early-stage (v0.1.0, 3 commits, ~125 LOC Dart).

## STRUCTURE

```
flame_alarm_game/
├── lib/                        # All Dart source (4 files)
│   ├── main.dart               # Entry: creates MemoryGame → GameWidget
│   └── game/
│       ├── memory_game.dart    # FlameGame subclass, card layout, sprite loader
│       └── components/
│           ├── memory_card.dart      # PositionComponent: card rendering (Paint, RRect)
│           └── memory_card_face.dart # Immutable singleton sprites from sprite sheet
├── assets/images/              # Single sprite sheet (memory-game-sprite.png, 4.6MB)
├── android/                    # Auto-generated Android platform code
├── ios/                        # Auto-generated iOS platform code
├── macos/                      # Auto-generated macOS platform code
├── windows/                    # Auto-generated Windows platform code
├── linux/                      # Auto-generated Linux platform code
└── web/                        # Auto-generated Web platform code
```

## WHERE TO LOOK

| Task | Location | Notes |
|------|----------|-------|
| Game logic / card layout | `lib/game/memory_game.dart` | Grid: 4x4, 16 cards |
| Card rendering | `lib/game/components/memory_card.dart` | Custom Canvas paint |
| Sprite slicing | `lib/game/components/memory_card_face.dart` | 3x3 grid from single sheet |
| Sprite helper | `lib/game/memory_game.dart:47` | Top-level `memoryGameSprite()` function |
| Dependencies | `pubspec.yaml` | Only flutter + flame |
| Lint rules | `analysis_options.yaml` | Extends `flutter_lints/flutter.yaml` |
| Assets | `assets/images/` | Declared in pubspec.yaml `flutter.assets` |

## CONVENTIONS

- **Singleton pattern** for card faces: `MemoryCardFace` uses factory + `_singletons` list (9 variants, indices 0-8)
- **Static Paint objects** on `MemoryCard`: shared across all instances for render perf
- **Top-level function** `memoryGameSprite()` lives outside any class in `memory_game.dart`
- **No tests exist**: `flutter_test` in devDependencies but no `test/` directory
- **No CI/CD**: no `.github/workflows/`, no Makefile, no Docker

## ANTI-PATTERNS (THIS PROJECT)

- **Off-by-one bug**: `memory_card_face.dart:8` asserts `index <= 9` but only 9 singletons exist (valid: 0-8). Index 9 → `RangeError`
- **No card pairing logic**: `memory_game.dart:24` assigns random faces without ensuring pairs — game is unplayable as memory game
- **Assert disabled in release**: The bounds check on card face index uses `assert()` which is stripped in production builds

## UNIQUE STYLES

- Card dimensions: 1024x559px with 175px gap, 100px radius constants on `MemoryGame`
- Colors: dark brown background (`0xff380c02`), gold border (`0xffdbaf58`), translucent orange outer border (`0x5cef971b`)
- Camera setup: viewfinder sized to fit 4x4 grid with centered anchor

## COMMANDS

```bash
flutter pub get          # Install dependencies
flutter analyze          # Lint check
flutter test             # Run tests (none exist yet)
flutter run              # Run on connected device / emulator
flutter run -d chrome    # Run in Chrome
flutter run -d windows   # Run on Windows
flutter build apk        # Build Android APK
flutter build web        # Build for web
```

## NOTES

- Dart SDK requirement: ^3.10.4 (recent)
- Android release signing uses debug keys — not production-ready (`android/app/build.gradle.kts`)
- Android Gradle JVM: 8GB heap configured (`android/gradle.properties`)
- Sprite sheet is 3x3 grid yielding 9 card faces at 1024x559 each
- `design.excalidraw` exists at root — likely contains game design mockups
- Platform directories (`android/`, `ios/`, etc.) are auto-generated Flutter boilerplate — rarely need manual edits
