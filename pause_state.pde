void updatePause() {
  //Speel weer verder
  if (!lastFrameKeysPressed['X'] && keysPressed['X'] ) {
    gamestate = "PLAY";
    play = !play;
  }

  updateKeys();
}

void drawPause() {
  noStroke();
  fill(0, 0, 0);
  rect(0, 0, width, height);

  textAlign(CENTER);

  //Titel
  textSize(72);
  fill(255, 255, 255);
  text("Game paused", width/2, 100);
  
  //Score
  textSize(28);
  fill(255, 255, 255);
  text("Current score: " + score, width/2, height/2 - 100);

  //Het aantal verslagen enemnies
  textSize(28);
  fill(255, 255, 255);
  image(pauseKills, width/2 - 150, height/2 - 45);
  text(killcount, width/2 + 25, height/2);

  //Als tijd 1 seconde is
  if (timeSurvived >= 60 && timeSurvived <= 120) {
    //Tijd
    textSize(28);
    fill(255, 255, 255);
    image(pauseClock, width/2 - 165, height/2 + 67);
    text(timeSurvivedDisplay +  " second", width/2 + 25, height/2 + 115);
  }

  //Als tijd meer of minder dan 1 seconde is
  if (timeSurvived < 60 || timeSurvived > 120) {
    //Tijd
    textSize(28);
    fill(255, 255, 255);
    image(pauseClock, width/2 - 165, height/2 + 67);
    text(timeSurvivedDisplay +  " seconds", width/2 + 25, height/2 + 115);
  }
}