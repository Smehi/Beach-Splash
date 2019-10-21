class Pointer {
  float x, y, w, h;
  float vy;
  PImage pointer; //image van de aanwijzer
  int pointerState; //De stituatie van de pointer
  final int MAX_OPTIONS = 4;
  final int MIN_OPTIONS = 1;

  /**************Initiele waarden van Pointer**************/

  void init() {
    x =  width/2 - 50;
    y = height/2 - 100;

    w = 32;
    h = 32;

    pointerState = 1;
    pointer = loadImage("Pointer.png");//Plaatje van aanwijzer
  }

  /**************Update de waarden van Player**************/

  void update() {

    if (gamestate == "START") {      
      //De pointer omlaag bewegen
      if (keysPressed[DOWN] && !lastFrameKeysPressed[DOWN]) {
        pointerState++;
        if (pointerState > MAX_OPTIONS) {
          pointerState = 1;
        }
      }

      //De pointer omhoog bewegen
      if (keysPressed[UP] && !lastFrameKeysPressed[UP]) {
        pointerState--;
        if (pointerState < MIN_OPTIONS) {
          pointerState = 4;
        }
      }
    }

    //TerugKnoppen
    if (gamestate == "LEADERBOARD") {
      pointerState = 4;
    }
    if (gamestate == "CONTROLS") {
      pointerState = 4;
    }


    //Plaats Pointer
    if (pointerState == 1) {
      x = 50;
      y = height/2 - 75;
    } else if (pointerState == 2) {
      x = 50;
      y = height/2 - 25;
    } else if (pointerState == 3) {
      x = 50;
      y = height/2 + 25;
    } else if (pointerState == 4) {
      x = 50;
      y = height - 125;
    }
  }

  /**************Teken Pointer**************/

  void draw() {
    image(pointer, x, y);
  }
}