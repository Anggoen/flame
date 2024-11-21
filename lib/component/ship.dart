import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 0.0;

  @override
  Ship() {
    arah = Vector2(0, 0);
    tujuan = position;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global;
    lookAt(tujuan);
    angle += pi;
    arah = arah - position;
    arah = arah.normalized();
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 100);
    angle = pi / 2; // Rotate the ship 90 degrees
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }

// kode percobaan flame part 1
  // @override
  // FutureOr<void> onLoad() async {
  //   sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
  //   position = Vector2(100, 100);
  //   size = Vector2(50, 50); //size untuk mengatur besar kecilnya
  //   scale = Vector2(1,
  //       1); //scale untuk mengatur bentuk nya mau agak gepeng memanjang atau terserah
  //   angle = pi / 0.1;
  //   // kode angle untuk mengatur posisi objek gambar apakah miring \terbalik\terjungkir dll
  //   anchor = Anchor.topLeft;
  // }

  // @override
  // FutureOr<void> onLoad() async {
  //   sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
  //   position = Vector2(100, 100);
  //   anchor = Anchor.center;
  // }

  // @override
  // void update(double dt) {
  //   position.add(Vector2(5, 10));
  //   position.add(Vector2(5, -20));
  //   // kode di atas untuk mengatur cepat atau lambatnya objek gambar

  //   super.update(dt);
  // }
}
