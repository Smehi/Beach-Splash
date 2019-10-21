class Player {
  float x, y, w, h;
  float vx, vy;
  boolean connected;
  PImage playerImage;
  int rotation;

  final int speed = 5;

  int hp;
  final int MAXHP = 100;
  final int HPADD = 25;

  int ammo;
  final int MAXAMMO = 100;
  final int AMMOADD = 50;

  /**************Initiele waarden van Player**************/
  void init() {
    //Maak de Player in het midden van e level
    x = width/2;
    y = height - h;

    //Formaat van Player sprite
    w = 55;
    h = 75;

    //Versnelling van speler
    vx = 0;
    vy = 0;

    //Welke kant kijkt de Player(0 = links, 1 = rechts)
    rotation = 1;

    //Staat de Player op een Platform/bodem
    connected = false;

    //Resources
    hp = MAXHP;
    ammo = MAXAMMO;

    //Start sprite van Player
    playerImage = loadImage("PlayerR.png");
  }//End init

  /**************Update de waarden van Player**************/

  void update() {
    //Shooting
    if (keysPressed['Z'] && !lastFrameKeysPressed['Z'] && ammo >= 5) {
      bulletsPlayer.add(new BulletPlayer());
      BulletPlayer bullet = bulletsPlayer.get(bulletsPlayer.size() - 1);
      bullet.fire();
      ammo -= 5;
    }

    //Movement
    //Sprite
    if (vx < 0) {
      playerImage = loadImage("PlayerL.png");
      rotation = 0;
    } else if (vx > 0) {
      playerImage = loadImage("PlayerR.png");
      rotation = 1;
    }

    //Beweeg links of rechts
    if (keysPressed[LEFT]) {
      vx = -speed;
    }
    if (keysPressed[RIGHT]) {
      vx = speed;
    }

    //Je kan niet beide kanten op. In plaats daarvan sta je stil.
    if (keysPressed[LEFT] && keysPressed[RIGHT]) {
      vx = 0;
    }
    if (!keysPressed[LEFT] && !keysPressed[RIGHT]) {
      vx = 0;
    }

    //Spring alleen als je op een Platform of op de bodem staat
    if (keysPressed[UP] && connected == true) {
      vy = -15;
      connected = false;
    }

    //if (keysPressed[DOWN] && y + h != height && connected) {
    //  y = y + 130;
    //}

    //Pas zwaartekracht alleen toe als de Player niet op Platform of bodem staat
    if (connected == false) {
      vy += g;
    }

    for (int i = 0; i < platforms.length; i++) {
      if (y > height-h) {
        land(height);
        break;
      } else if (intersect(player, platforms[i]) && vy > 0 && !keysPressed[DOWN] && y + h <= platforms[i].y + platforms[i].h) {
        land(platforms[i].y);
        break;
      } else {
        connected = false;
      }
    }

    //De speler kan de level niet verticaal uit naar boven
    if (y <= 0) {
      y = 0;
    }

    //De speler kan de level niet horizontaal uit
    if (x < 0) {
      x = 0;
    }
    if (x > width - 65) {
      x = width - 65;
    }

    x += vx;
    y += vy;

    //Resources
    if (intersect(player, hpDrop) && hp < MAXHP) {
      hp += HPADD;
      hpDrop.respawn();
    }
    if (intersect(player, ammoDrop) && ammo < MAXAMMO) {
      ammo = ammo + AMMOADD;
      ammoDrop.respawn();
      ammoDrop.respawnCounter = 0;
    }

    if (hp > MAXHP) {
      hp = MAXHP;
    }
    if (ammo > MAXAMMO) {
      ammo = MAXAMMO;
    }

    for (int i = 0; i < bulletsBeachboy.size(); i++) {
      BulletBeachboy aBulletBeachboy = bulletsBeachboy.get(i);
      if (intersect(player, aBulletBeachboy)) {
        hp -= 10;
        bulletsBeachboy.remove(aBulletBeachboy);
      }
    }

    if (hp <= 0) {
      updateHighscore(); //highscores worden bijgewerkt (zie tab leaderboard_state)
      gamestate = "GAMEOVER";
    }
  }//End update

  /**************Teken Player**************/

  void draw() {
    image(playerImage, x, y);
  }//End draw

  /**************Extra methodes Player**************/

  //Player land op een platform
  void land(float grond) {
    vy = 0;//Pas geen zwaartekracht meer toe
    connected = true;
    y = grond - h;
  }//End land
}//End Player class