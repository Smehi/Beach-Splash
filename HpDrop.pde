class HpDrop {
  float x, y, w, h;
  float vy;
  boolean connected;
  int respawnCounter;
  PImage hpDropImage;

  final int respawnTime = 30 * sec;

  /**************Initiele waarden van HpDrop**************/
  void init() {
    //Start locatie
    x = random(100, width-100);
    y = random(100, height-100);

    //Formaat
    w = 30;
    h = 50;

    //Geen versnelling in het begin
    vy = 0;

    //Is niet op Platform of bodem in het begin
    connected = false;

    //Respawn
    respawnCounter = 0;

    //Image
    hpDropImage = loadImage("HpDrop.png");
  }

  /**************Update de waarden van HpDrop**************/

  void update() {
    if (respawnCounter != respawnTime) {
      respawnCounter++;
    }

    respawn();

    if (!connected) {
      vy += g;
    }

    y += vy;

    //Check of HpDrop op op bodem op Platform is
    for (int i = 0; i < platforms.length; i++) {
      if (y > height - h) {//Op bodem
        land(height);
      } else if (intersect(hpDrop, platforms[i])) {
        land(platforms[i].y);//Op platform
      } else {
        connected = false;
      }
    }
  }

  /**************Teken HpDrop**************/

  void draw() {
    image(hpDropImage, x, y);
  }

  /**************Extra methodes HpDrop**************/

  void land(float grond) {
    vy = 0;
    connected = true;
    y = grond - h;
  }

  void respawn() {

    if (respawnCounter == respawnTime) {
      init();
      respawnCounter = 0;
    } else if (intersect(player, hpDrop) && player.hp != player.MAXHP) {
      x = -100;
      y = -100;
      respawnCounter = 0;
    }
  }
}