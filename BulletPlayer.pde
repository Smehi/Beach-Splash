class BulletPlayer {
  float x, y, w, h;
  float vx;
  boolean isFired;
  PImage bulletPlayerImage = loadImage("Bullet.png");//Zet sprite BulletPlayer

  /**************Initiele waarden van BulletPlayer**************/
  void init() {
    //Start positie buiten het sherm
    x = -100;
    y = -100;

    //Formaat
    w = 20;
    h = 20;

    //Snelheid
    vx = 0;

    //Bullet Player wordt niet afgefuurd
    isFired = false;
  }//End init

  /**************Update de waarden van BulletPlayer**************/

  void update() {
    if (isFired) {
      if (x > width || x< 0 || y > height || y < 0) {
        init();
      }

      for (int i = 0; i < bulletsPlayer.size(); i++) {
        BulletPlayer aBulletPlayer = bulletsPlayer.get(i);
        for (int j = 0; j < platforms.length; j++) {
          if (intersect(aBulletPlayer, platforms[j])) {
            aBulletPlayer.init();
          }
        }
      }
    }

    x += vx;
  }//End update

  /**************Teken BulletPlayer**************/

  void draw() {
    image(bulletPlayerImage, x, y);
  }//End draw

  /**************Extra methodes BulletPlayer**************/

  void fire() {
    if (!isFired) {
      isFired = true;
      //Start locatie  en start snelheid bulletPlayer afhankelijk van wellke richting de Player kijkt     
      y = player.y + player.h / 2;

      if (player.rotation == 1) {
        x = player.x + player.w;
        vx = 12;
      } else if (player.rotation == 0) {
        x = player.x;
        vx = -12;
      }
    }
  }//End fire
}//End BulletPlyer class