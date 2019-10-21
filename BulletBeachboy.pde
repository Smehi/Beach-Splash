class BulletBeachboy {
  float x, y, w, h;
  float vx;
  boolean isFired;
  PImage bulletBeachboyImage = loadImage("BulletEnemy.png");//Zet sprite BulletPlayer

  /**************Initiele waarden van BulletBeachboy**************/
  void init() {
    //Start positie buiten het sherm
    x = -100;
    y = -100;

    //Formaat
    w = 10;
    h = 10;

    //Snelheid
    vx = 0;

    //BulletBeachboy wordt niet afgefuurd
    isFired = false;
  }//End init

  /**************Update de waarden van BulletBeachboy**************/

  void update() {
    if (isFired) {
      if (x > width || x< 0 || y > height || y < 0) {
        bulletsBeachboy.remove(this);
      }


      for (int i = 0; i < platforms.length; i++) {
        if (intersect(this, platforms[i])) {
          bulletsBeachboy.remove(this);
        }
      }
    }

    x += vx;
  }//End update

  /**************Teken BulletBeachboy**************/

  void draw() {
    image(bulletBeachboyImage, x, y);
  }//End draw
}//End BulletPlyer class