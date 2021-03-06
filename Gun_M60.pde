final class Gun_M60 extends Gun {
  Gun_M60(int maxAmmo) {
    super();
    myMaxAmmo = maxAmmo;
    myAmmo = myMaxAmmo;
    myRateOfFire = 6;
    myDamage = 10;
    gunImage = M60.copy();
    numShots = 1;
  }
  void reload() {
    if (!reloading) {
      myAmmo = 0;
      reloading = true;
    }
    if (reloading) {
      if (myAmmo < myMaxAmmo) {
        if (frameCount%1 == 0) {
          myAmmo++;
        }

        // Draws the green rectangle to show visual reloading progress.
        pushMatrix();
        fill(255, 255, 0);
        rectMode(CORNER);
        rect(myX - 50, myY+ 20, 100*(myAmmo/myMaxAmmo), 10);
        rectMode(CENTER);
        fill(0);
        textAlign(CENTER);
        text("RELOADING", myX, myY+30);
        popMatrix();
      } else {
        reloading = false;
      }
    }
  }
}