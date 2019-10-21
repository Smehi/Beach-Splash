void updatePlay() {
  if (gamestate == "PLAY") {
    //Zet de game op pauze en speel weer verder
    if (!lastFrameKeysPressed['X'] && keysPressed['X'] ) {
      gamestate = "PAUSE";
      play = !play;
    }
  }


  player.update();

  for (int i = 0; i < beachboys.size(); i++) {
    beachboys.get(i).update();
  }


  for (int i = 0; i < bulletsPlayer.size(); i++) {
    bulletsPlayer.get(i).update();
    ;
  }

  for ( int i = 0; i < bulletsBeachboy.size(); i++) {
    bulletsBeachboy.get(i).update();
  }

  hpDrop.update();
  ammoDrop.update();

  updateKeys();//Controlleer welke knoppen worden ingedrukt/losgelaten
}//End updateGame

void drawPlay() {
  //Zet achtergrond
  background(backgroundImage);

  timeSurvived++;

  if (timeSurvived % sec == 0) {
    timeSurvivedDisplay++;
  }


  player.draw();

  for (int i = 0; i < beachboys.size(); i++) {
    beachboys.get(i).draw();
  }

  for (int i =0; i < platforms.length; i++) {
    platforms[i].draw();
  }

  for (int i = 0; i <bulletsPlayer.size(); i++) {
    bulletsPlayer.get(i).draw();
  }

  for (int i = 0; i < bulletsBeachboy.size(); i++) {
    bulletsBeachboy.get(i).draw();
  }

  hpDrop.draw();
  ammoDrop.draw();

  rules();
  drawStats();
}//End drawGame

void drawStats() {
  //Health
  fill(255, 0, 0);
  image(hpIcon, 10, 10);
  rect(36, 10, player.hp * 2, 16);

  //Ammo
  fill(0, 0, 255);
  image(ammoIcon, 10, 36);
  rect(36, 36, player.ammo * 2, 16);

  //Score
  textAlign(LEFT);
  textSize(32);
  fill(0);
  text("Score: " + score, width - 300, 50);

  //Tijd
  textSize(32);
  fill(0);
  //image(pauseClock, width/2 - 165, 50);
  text(timeSurvivedDisplay, width/2 -10, 75);
}

void rules() {
  if (killcount % 4 == 0 && killcount != 0) {
    beachboys.add(new Beachboy());
  }
  for (int i = 0; i < beachboys.size(); i++) {
    Beachboy aBeachboy = beachboys.get(i);
    if (aBeachboy.hp == 0) {
      killcount += 1;
      aBeachboy.respawn();
    }
  }

  //ScoreMultiplier wordt verhoogd met 1% per 5 seconden
  if (timeSurvived % sec*5 == 0) {
    scoreMultiplier += 0.02;
  }

  //Per enemy krijg je 10% meer punten
  scoreMultiplierPerEnemy += (beachboys.size() / 100) * 20;

  //
  score = (int) round(((killcount * 100) + timeSurvivedDisplay * 10) * (scoreMultiplier + scoreMultiplierPerEnemy));
}