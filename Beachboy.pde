class Beachboy {
  float x, y, w, h;
  float vx, vy;
  boolean connected;
  PImage beachboyImage;
  int rotation;//0 is links, 1 is rechts
  boolean canShoot;
  int canShootCounter;

  //Snelheid
  final int speed = 4;

  //Hp
  int hp;
  final int MAXHP = 30;

  /**************Initiele waarden van Beachboy**************/
  void init() {
    //Maak Beachboy op een random plek op map
    x = 100;
    y = 260;

    //Formaat van Beachboy sprite
    w = 55;
    h = 75;

    //Snelheid van Beachboy
    vx = 0;
    vy = 0;

    //Beachboy kijkt naar rechts aan het begin van de game
    rotation = 1;

    //Staat Beachboy op een Platform/bodem
    connected = false;

    //Shiet waardes
    canShoot = true;
    canShootCounter = 0;

    //Resources
    hp = MAXHP;

    //Start sprite van Beachboy
    beachboyImage = loadImage("EnemyR.png");
  }//End init

  /**************Update de waarden van Beachboy**************/

  void update() {
    //SHOOTING

    if (abs(this.y - (player.y +player.h/2)) <= 50 || y == player.y) {//Shiet als Player in range is
      if (canShoot) {//Kan alleen schieten als hij niet heeft geschoten
        canShoot = false;
        bulletsBeachboy.add(new BulletBeachboy());
        for (int i = 0; i < bulletsBeachboy.size(); i++) {
          BulletBeachboy aBulletBeachboy = bulletsBeachboy.get(bulletsBeachboy.size() -1);
          //Maak de BulletBeachboy in het midden van Beachboy
          aBulletBeachboy.y = y + h/2;
          //Maak de BulletBeachboy afhankelijk van welke richting Beachboy kijkt
          if (rotation == 0) {
            aBulletBeachboy.x = x;
            aBulletBeachboy.vx = -12;
          } else if (rotation == 1) {
            aBulletBeachboy.x = x + w;
            aBulletBeachboy.vx = 12;
          }
        }
      }
    }

    //Timer voor shieten
    if (!canShoot) {
      canShootCounter++;
      if (canShootCounter == 1 * sec) {
        canShoot = true;
        canShootCounter = 0;
      }
    }


    //MOVEMENT

    //Verander plaatje afhankelijk van hoe Beachboy staat
    if (vx > 0) {
      beachboyImage = loadImage("EnemyR.png");
      rotation = 1;
    } else if (vx < 0) {
      beachboyImage = loadImage("EnemyL.png");
      rotation = 0;
    } else if (vx == 0) {
      if (x < player.x) {
        beachboyImage = loadImage("EnemyR.png");
        rotation = 1;
      } else if (x > player.x) {
        beachboyImage = loadImage("EnemyL.png");
        rotation = 0;
      }
    }

    //Volg Player

    //Zelfde hoogte als Player
    if (abs(y - (player.y +player.h/2)) <= 50) {
      if (x < player.x - 250) {
        vx = speed;
      } else if (x > player.x + 250) {
        vx = -speed;
      } else {
        vx = 0;
      }
      //Sta niet op andere Beachboys
      for (int i = 0; i < beachboys.size(); i++) {
        Beachboy aBeachboy = beachboys.get(i);
        if (this != aBeachboy) {
          if (intersect(this, aBeachboy)) {
            if (this.x < aBeachboy.x) {
              this.x -= this.w;
            } else if (this.x > aBeachboy.x) {
              this.x += this.w;
            }
          }
        }
      }
    }
    //Hoger dan Player
    if (abs(y - (player.y +player.h/2)) > 50) {
      if (rotation == 1) {
        vx = speed;
      } else if (rotation == 0) {
        vx = -speed;
      }
      //Sta niet op andere Beachboys
      for (int i = 0; i < beachboys.size(); i++) {
        Beachboy aBeachboy = beachboys.get(i);
        if (this != aBeachboy) {
          if (intersect(this, aBeachboy)) {
            if (this.x < aBeachboy.x) {
              this.x -= 5;
              vx = -vx;
            } else if (this.x > aBeachboy.x) {
              this.x += 5;
              vx = -vx;
            }
          }
        }
      }
    }
    //Lager dan Player
    if (y - (player.y + player.h/2) > 100) {
      for (int i = 0; i < platforms.length; i++) {
        if (abs(y - platforms[i].y) <= 100 &&
          x > platforms[i].x && x + w < platforms[i].x + platforms[i].w && vy == 0) {
          vy = -15;
          connected = false;
        } else {
          if (rotation == 0) {
            vx = -speed;
          } else if (rotation == 1) {
            vx = speed;
          }
        }
      }
      //Sta niet op andere Beachboys
      for (int i = 0; i < beachboys.size(); i++) {
        Beachboy aBeachboy = beachboys.get(i);
        if (this != aBeachboy) {
          if (intersect(this, aBeachboy)) {
            if (this.x < aBeachboy.x) {
              this.x -= 5;
              vx = -vx;
            } else if (this.x > aBeachboy.x) {
              this.x += 5;
              vx = -vx;
            }
          }
        }
      }
    }



    //Als Beachboy tegen zijkant botst verandert hij van richting    
    if (x < 0) {
      vx = speed;
    }
    if (x + w> width) {
      vx = -speed;
    }

    //Als Beachboy niet op Platform/bodem staat, pas zwaartekracht toe
    connected = false;
    if (!connected) {
      vy += g;
    }

    //Toepassen snelheid
    x += vx;
    y += vy;

    //Beacboy kan de map niet verticaal verlaten
    if (y < 0) {
      y = 0;
    }
    if (y + h > height) {
      land(height);
    }
    
    //Check of Beachboy op Platform staat
    for (int i = 0; i < platforms.length; i++) {
      if (!connected) {
        if (intersect(this, platforms[i]) && vy > 0) {
          land(platforms[i].y);
        }
      }
    }



    //Check of Beachboy wordt geraakt door BulletPlayer
    for (int j = 0; j < bulletsPlayer.size(); j++) {
      BulletPlayer aBulletPlayer = bulletsPlayer.get(j);
      if (intersect(this, aBulletPlayer)) {
        this.hp  -= 10;
        bulletsPlayer.remove(aBulletPlayer);
      }
    }
  }//End update

  /**************Teken Beachboy**************/

  void draw() {
    //Plaatje Beachboy
    image(beachboyImage, x, y);
    //Hp bar
    fill(255, 0, 0);
    rect(x+w/2-hp, y-10, hp*2, 5);
  }

  /**************Extra methodes Beachboy**************/
  
  
  void land(float grond) {
    vy = 0;
    connected = true;
    y = grond - h;
  }//End land

  void respawn() {
    init();
    x = random(100, width-100);
    y = random(100, height- h);
  }
}//End clss Beachboy