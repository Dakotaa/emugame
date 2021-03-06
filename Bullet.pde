class Bullet {
  PVector myPosition, myVelocity, mySpeed;
  float myTheta, velocity, myXEnd, myYEnd, myDamage;
  boolean myAiming;
  boolean visible = true;
  Bullet (PVector position, float velocity, float theta, float xEnd, float yEnd, boolean aiming, float damage) {
    myPosition = position;
    myVelocity = new PVector(15, 15);
    this.velocity = velocity;
    myXEnd = xEnd;
    myYEnd = yEnd;
    myAiming = aiming;
    myDamage = damage;

    // checks if the gun is aimed, adjusts the exit angle accordingly
    if (myAiming) {
      myTheta = theta + radians(random(-gunInnac, gunInnac));
    } else {
      myTheta = theta+radians(random(-2, 2) + random(-gunInnac, gunInnac));
    }
    
    // math to find angle the bullet will travl at
    if (mouseX >= truck.gunX()) {
      myVelocity.y = ((float) ((velocity) * (Math.sin(Math.abs((myTheta))))));
      myVelocity.x = ((float) Math.sqrt((((velocity)*(velocity))-((myVelocity.y)*(myVelocity.y)))));
      if (mouseY < truck.getY()) {
        myVelocity.y*=-1;
      }
    } else {
      myVelocity.y = ((float) ((velocity) * (Math.sin(Math.abs((myTheta))))));
      myVelocity.x = ((float) Math.sqrt((((velocity)*(velocity))-((myVelocity.y)*(myVelocity.y)))))*-1;
    }
  }

  float getDamage() {
    return myDamage;
  }

  float getX() {
    return myPosition.x;
  }

  float getY() {
    return myPosition.y;
  }

  void drawBullet() {
    pushMatrix();
    myPosition.x += myVelocity.x;
    myPosition.y += myVelocity.y;
    translate(myPosition.x, myPosition.y);
    rotate((myTheta));
    rectMode(CENTER);
    fill(0);
    rect(80, 0, 5, 3);
    popMatrix();
  }
}
