void updateControls() {
  //Ga terug naar het start scherm
  if (pointer.pointerState == 4 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    gamestate = "START";
    pointer.pointerState = 1;
  }

  pointer.update();
  updateKeys();
}

void drawControls() {
  //Teken de achtergrond
  noStroke();
  fill(0, 228, 255);
  rect(0, 0, width, height/3);
  fill(0, 100, 255);
  rect(0, height/3, width, height/3);
  fill(240, 180, 30);
  rect(0, height/3+height/3, width, height/3);

  image(controlsBackground, 0, 0);//Teken Controls

  textAlign(CENTER);

  //Titel
  textSize(72);
  fill(0, 0, 255);
  text("Controls", width/2, 100);

  textAlign(LEFT);

  //Terugknop
  textSize(36);
  fill(255, 0, 0);
  text("Back", 100, height - 100);

  pointer.draw();
}