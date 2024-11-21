import 'dart:async';
import 'dart:ui';

// import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
// import 'package:flutter/physics.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    // Asteroid a = Asteroid();
    // add(a);
    s = Ship();
    add(s);
    asp = AsteroidSpawner();
    add(asp);
    // add(SpriteComponent(sprite: await loadSprite("ships/spaceShips_001.png")));
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
    // s.position = info.eventPosition.global;
  }
}
