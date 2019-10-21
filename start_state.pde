void updateStart() {
  //Ga naar het play scherm
  if (pointer.pointerState == 1 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    setup();
    gamestate = "PLAY";
  }
  //Ga naar leaderboards scherm
  if (pointer.pointerState == 2 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    gamestate = "LEADERBOARD";
  }
  //Ga naar controls scherm
  if (pointer.pointerState == 3 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    gamestate = "CONTROLS";
  }
  //Exit game
  if (pointer.pointerState == 4 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    exit();
  }

  pointer.update();
  updateKeys();
}

void drawStart() {
  noStroke();
  fill(0, 228, 255);
  rect(0, 0, width, height/3);
  fill(0, 100, 255);
  rect(0, height/3, width, height/3);
  fill(240, 180, 30);
  rect(0, height/3+height/3, width, height/3);

  textAlign(CENTER);

  textSize(72);
  fill(0, 0, 255);
  text("BeachSplash", width/2, 100);

  textAlign(LEFT);

  textSize(36);
  fill(255, 0, 0);
  text("Play", 100, height/2 - 50);

  textSize(36);
  fill(255, 0, 0);
  text("Leaderboards", 100, height/2);

  textSize(36);
  fill(255, 0, 0);
  text("Controls", 100, height/2 + 50);

  textSize(36);
  fill(255, 0, 0);
  text("Exit", 100, height - 100);

  pointer.draw();
}