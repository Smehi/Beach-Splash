void updateGameOver() {
  timeCounter++;//Telt op

  //Na een bepaalde tijd of wanneer de speler op 'X' drukt naar Leaderboard scherm gaan
  if (timeCounter == timeStaying || keysPressed['X'] && !lastFrameKeysPressed['X']) {
    gamestate = "LEADERBOARD";
  }
  
  //Telt af
  if (timeCounter % sec == 0) {
    timeCountdown--;
  }

  updateKeys();
}

void drawGameOver() {
  //Fade
  alpha += 2;
  noStroke();
  fill(0, 0, 0, alpha);
  rect(0, 0, width, height);
  if (alpha >= 255) {
    alpha = 255;
  }

  textAlign(CENTER);

  textSize(72);
  fill(255, 255, 255, alpha);
  text("You are SOAKED!", width/2, 100);

  //Score
  textSize(28);
  fill(255, 255, 255, alpha);
  text("Final score: " + score, width/2, height/2 - 100);

  //Tijd
  textSize(28);
  fill(255, 255, 255, alpha);
  text(timeCountdown, width/2, height - 100);

  //Kills
  textSize(28);
  fill(255, 255, 255, alpha);
  image(pauseKills, width/2 - 150, height/2 - 45);
  text(killcount, width/2 + 25, height/2);

  //Als tijd 1 seconde is
  if (timeSurvived >= 60 && timeSurvived <= 120) {
    //Tijd
    textSize(28);
    fill(255, 255, 255, alpha);
    image(pauseClock, width/2 - 165, height/2 + 67);
    text(timeSurvivedDisplay +  " second", width/2 + 25, height/2 + 115);
  }

  //Als tijd meer of minder dan 1 seconde is
  if (timeSurvived < 60 || timeSurvived > 120) {
    //Tijd
    textSize(28);
    fill(255, 255, 255, alpha);
    image(pauseClock, width/2 - 165, height/2 + 67);
    text(timeSurvivedDisplay +  " seconds", width/2 + 25, height/2 + 115);
  }

  //Skip button
  textSize(28);
  fill(255, 255, 255, alpha);
  text("Press 'X' to skip ", width/2, height-50);
}