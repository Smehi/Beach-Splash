float g = 0.6;//Zwaartekracht

PImage backgroundImage;
PImage controlsBackground;
PImage hpIcon, ammoIcon;
PImage pauseKills, pauseClock;

String gamestate;//Waarde voor Game schermen
int score;
int killcount;
boolean play;
int timeSurvived;
int timeSurvivedDisplay;
float scoreMultiplier, scoreMultiplierPerEnemy;
int alpha ;
int timeCounter;
int timeCountdown;

final int sec = 60;//Er zijn 60 frames per seconden
final int timeStaying = sec *10; //10 seconden voordat je naar leaderboards scherm gaat

Player player = new Player();
Platform[] platforms = new Platform[8];
ArrayList<Beachboy> beachboys = new ArrayList<Beachboy>();
ArrayList<BulletPlayer> bulletsPlayer = new ArrayList<BulletPlayer>();
ArrayList<BulletBeachboy> bulletsBeachboy = new ArrayList<BulletBeachboy>();

HpDrop hpDrop = new HpDrop();
AmmoDrop ammoDrop = new AmmoDrop();

Pointer pointer = new Pointer();


void setup() {
  size(1600, 900);//Dit is de resolutie van de game(16:9 verhouding)
  backgroundImage = loadImage("SplashArt.png");//Default achtergrond

  LoadHighscore();//Highscorelijst wordt geladen bij het openen van het spel

  pointer.init();

  //Voor GameOver scherm
  alpha = 0;//Doorzichtigheid
  timeCounter = 0;//Telt seconden op
  timeCountdown = 10;//Telt seconden af


  score = 0;
  killcount = 0;
  play = true;

  timeSurvived = 0;
  timeSurvivedDisplay = 0;
  scoreMultiplier = 1;

  player.init();

  //Als de game begint zijn er geen extra objecten op het veld
  beachboys.clear();
  bulletsBeachboy.clear();
  bulletsPlayer.clear();

  //Initialiseer de eerste enemy
  beachboys.add(new Beachboy());
  beachboys.get(beachboys.size() - 1).init();

  //Maak de platformen
  for (int i = 0; i < platforms.length; i++) {
    platforms[i] = new Platform();
  }

  //Plaats de platformen
  platforms[0].init(0, 725, 320);
  platforms[1].init(640, 725, 320);
  platforms[2].init(width-320, 725, 320);
  platforms[3].init(270, 550, 420);
  platforms[4].init(910, 550, 420);
  platforms[5].init(0, 375, 320);
  platforms[6].init(640, 375, 320);
  platforms[7].init(width-320, 375, 320);


  //HpDrop wordt buiten het veld geinitialiseerd
  hpDrop.init();
  hpDrop.x = -100;
  hpDrop.y = -100;
  hpIcon = loadImage("HpIcon.png");

  //AmmoDrop wordt buiten het veld geinitialiseerd
  ammoDrop.init();
  ammoDrop.x = -100;
  ammoDrop.y = -100;
  ammoIcon = loadImage("AmmoIcon.png");//Plaatje van ammoDrop

  //Plaatjes voor het aangeven van het aantal verslagen enemies en de tijdsduur van het spel
  pauseKills = loadImage("Eliminations.png");//Geeft het aantal verslagen enemies aan
  pauseClock = loadImage("Clock.png");//Geeft het tijdsduur van het spel aan

  //Plaatje van Controls
  controlsBackground = loadImage("Controls.png");

  //Het spel begint in het Start scherm
  gamestate = "START";
}//End setup

void draw() {
  //Start sherm
  if (gamestate == "START") {
    updateStart();
    drawStart();
  }
  //Leaderboard scherm
  if (gamestate == "LEADERBOARD") {
    updateLeaderboard();
    drawLeaderboard();
  }
  //Controls scherm
  if (gamestate == "CONTROLS") {
    updateControls();
    drawControls();
  }
  //GameOver scherm
  if (gamestate == "GAMEOVER") {
    updateGameOver();
    drawGameOver();
  }
  //Het spel zelf
  if (play) {
    if (gamestate == "PLAY") {
      updatePlay();
      drawPlay();
    }
  }
  //Pauze scherm
  if (!play) {
    if (gamestate == "PAUSE") {
      updatePause();
      drawPause();
    }
  }
}//End draw