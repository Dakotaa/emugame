class NaziEmu extends Emu {
  boolean heiling;
  PImage runPhotos[] = new PImage[34];
  PImage runPhotosF[] = new PImage[34];
  PImage heilPhotos[] = new PImage[34];
  PImage heilPhotosF[] = new PImage[34];

  NaziEmu(float x, float y, float size) {
    super(x, y, size);  
    for (int i = 1; i < runPhotos.length; i++) {
      runPhotos[i] = naziEmuRun[i].copy();
      runPhotos[i].resize((int) (mySize*400), (int) (mySize*406));
    }

    for (int i = 1; i < runPhotosF.length; i++) {
      runPhotosF[i] = naziEmuRunFlip[i].copy();
      runPhotosF[i].resize((int) (mySize*400), (int) (mySize*406));
    }

    for (int i = 1; i < heilPhotos.length; i++) {
      heilPhotos[i] = naziEmuAttack[i].copy();
      heilPhotos[i].resize((int) (mySize*400), (int) (mySize*406));
    }

    for (int i = 1; i < heilPhotosF.length; i++) {
      heilPhotosF[i] = naziEmuAttackFlip[i].copy();
      heilPhotosF[i].resize((int) (mySize*400), (int) (mySize*406));
    }
  }

  void attack() { 
    if (myX > truck.getX() - 100 && myX < truck.getX() + 100 && myY > truck.getY() - 100 && myY < truck.getY() + 100) { 
      heiling = true;
      if (frameCount%(int(random(125, 175))) == 0) { 
        truck.reduceHP(0.05);
      } else {
        heiling = false;
      }
    }
  }

  void update() {
    super.update();

    if (heiling) {
      if (frameNum > heilPhotos.length - 1) {
        frameNum = 1;
      }
      if (xVelocity() > 0) {
        image(heilPhotosF[frameNum], myX, myY);
      } else {
        image(heilPhotos[frameNum], myX, myY);
      }
    } else {
      if (frameNum > runPhotos.length - 1) {
        frameNum = 1;
      }

      if (xVelocity() > 0) {
        image(runPhotosF[frameNum], myX, myY);
      } else {
        image(runPhotos[frameNum], myX, myY);
      }
    }
  }
}
