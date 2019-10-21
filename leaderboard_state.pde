String finalscore;
String[] highscoreList = new String[500];
int[] highscore = new int[500];
final int VISIBLEHIGHSCORES = 10; //zichtbaar aantal scores in leaderboard

void updateLeaderboard() {
  //Ga terug naar het start scherm
  if (pointer.pointerState == 4 && keysPressed['Z'] && !lastFrameKeysPressed['Z']) {
    gamestate = "START";
    pointer.pointerState = 1;
  }

  pointer.update();
  updateKeys();
}

void updateHighscore() { //updateHighscore wordt uitgevoerd wanneer de player dood is (zie Player class)
  finalscore = str(score); //score van de player wordt omgezet in een string om op te slaan in een .txt file
  AddtoList(); //toevoegen aan highscorelijst
  SaveHighscore(); //opslaan op lijst 
  LoadHighscore(); //laden van lijst
}



void AddtoList() { //score van de player wordt toegevoegd
  highscoreList = append(highscoreList, finalscore);
}

void SaveHighscore() { //score wordt opgeslagen in Highscore.txt file
  saveStrings("Highscore.txt", highscoreList);
}

void LoadHighscore() { //scores worden als string geladen vanuit Highscore.txt
  highscoreList = loadStrings("Highscore.txt");
  for (int i = 0; i < highscoreList.length; i++) {
    highscore[i] = int(highscoreList[i]); //scores worden omgezet naar integers om later op volgorde te kunnen zetten
  }
}

void SortList() { //highscorelijst wordt gesorteerd 
  highscore = reverse(sort(highscore)); //lijst wordt ook omgekeerd, anders staan de scores van laag naar hoog
}

void drawLeaderboard() { //Weergeven van de leaderboard, wordt aangeroepen in de main class
  textAlign(CENTER);

  noStroke();
  fill(0, 228, 255);
  rect(0, 0, width, height/3);
  fill(0, 100, 255);
  rect(0, height/3, width, height/3);
  fill(240, 180, 30);
  rect(0, height/3+height/3, width, height/3);

  fill(0); //Array wordt gesorteerd
  for (int i = 0; i < highscore.length; i++)
  {
    SortList(); //sorteren wordt hier aangeroepen
  }

  fill(0); //voor het aantal zichtbare scores (VISIBLEHIGHSCORES) worden de highscores en de posities weergegeven
  for (int i = 0; i < VISIBLEHIGHSCORES; i++)
  {
    text((i + 1) + ".  ", width/2 - 50, 240 + 50*i);
    text(highscore[i], width/2 + 50, 240 + 50*i);
  }



  textSize(72);
  fill(0, 0, 255);
  text("Leaderboard", width/2, 100);

  textAlign(LEFT);

  textSize(36);
  fill(255, 0, 0);
  text("Back", 100, height - 100);

  pointer.draw();
}