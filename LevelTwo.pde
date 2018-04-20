class LevelTwo extends Level {
  LevelTwo() {
  }

  void setupLevel() {
    for (int i = 0; i < 250; ++i) {
      emus.add(new Emu(random(width*.75, width), random(300, height-300), (int) random(40, 100), random(0.1, 0.3)));
    }
    guns.add(new Gun_Minigun(500));
    for (Gun g : guns) {
      g.setAmmo(g.getMaxAmmo());
    }
    truck.setX(200);
    truck.setY(200);
    truck.setHeading(PI);
    truck.setSpeed(0);
    truck.setHP(1);
    truck.resetMaxSpeed();
  }


  void update() {
    super.update();
  }
}
