class AmmoDrop {
  float x, y, w, h;
  float vy;
  boolean connected;
  int respawnCounter;
  PImage ammoDropImage;

  final int respawnTime = 10 * sec;//Ammodrop respawn automatisch na 10 seconden

  /**************Initiele waarden van HpDrop**************/
  void init() {
    //Start locatie
    x = random(100, width-100);
    y = random(100, height-100);

    //Formaat
    w = 30;
    h = 50;

    //Geen snelheid aan het begin van de game
    vy = 0;

    //Begint niet op Platform of bodem
    connected = false;

    //Respawn
    respawnCounter = 0;

    //Image
    ammoDropImage = loadImage("AmmoDrop.png");
  }

  /**************Update de waarden van AmmoDrop**************/

  void update() {
    //Repawn na een bepaalde tijd
    if (respawnCounter != respawnTime) {
      respawnCounter++;
    }

    respawn();

    //Pas zwaartekracht toe als AmmoDrop niet op bodem of Platfoorm is
    if (!connected) {
      vy += g;
    }
    
    //Pas snelheid toe
    y += vy;


    //Check of AmmoDrop op bodem of Platform is
    for (int i = 0; i < platforms.length; i++) {
      if (y > height - h) {//Op bodem
        land(height);
      } else if (intersect(ammoDrop, platforms[i])) {
        land(platforms[i].y);//Op platform
      } else {
        connected = false;
      }
    }
  }

  /**************Teken AmmoDrop**************/

  void draw() {
    image(ammoDropImage, x, y);
  }

  /**************Extra methodes AmmoDrop**************/
  //Val niet door Bodem of Platform
  void land(float grond) {
    vy = 0;
    connected = true;
    y = grond - h;
  }

  //Respawn
  void respawn() {
    //Respawn na bepaalde tijd
    if (respawnCounter == respawnTime) {
      init();
      respawnCounter = 0;
    } 
    //Respawn als de Player het oppakt en geen volle ammo heeft
    else if (intersect(player, ammoDrop) && player.ammo != player.MAXAMMO) {
      x = -100;
      y = -100;
      respawnCounter = 0;
    }
  }
}