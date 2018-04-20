class HUD {
  boolean HP, ammo, items;
  HUD (boolean hp, boolean a, boolean i) {
    HP = hp;
    ammo = a;
    items = i;
  }
  void showFPS() {
    text("FPS: " + (int) frameRate, 10, 20);  
  }
  void showHP() {
    text("Truck Condition: " + (int) (truck.getHP()*100) + "%", 100, 20);
  }

  void showAmmo() {
    for (Gun g : guns) {
        if (g.getReloading()) {
        text("Reloading", 400, 20);
      } else {
        text("Ammo: " + (int) g.getAmmo() + " | " + (int) g.getMaxAmmo(), 400, 20);
      }
    }
  }

  void showItems() {
  }

  void update() {
    fill(0);
    textSize(20);
    textAlign(LEFT);
    showFPS();
    showHP();
    showAmmo();
    showItems();
  }
}
