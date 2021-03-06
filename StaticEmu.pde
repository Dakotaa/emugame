class StaticEmu extends Emu {
  //emu object that does not change size(easier for larger amounts of emus, better performance)
  StaticEmu(float x, float y, float size) {
    super(x, y, size);
    myHP = 100;
    maxHP = myHP;
    mySize = size;
    speedModifier = 1;
  }

  void update() {
    super.update();

    if (frameNum > emuRun.length - 1) {
      frameNum = 1;
    }

    if (xVelocity() > 0) {
      image(emuRunFlip[frameNum], myX, myY);
    } else {
      image(emuRun[frameNum], myX, myY);
    }
  }
}