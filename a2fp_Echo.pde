Tile[][] _boardA;
Tile[][] _boardB;
Tile[][] _boardC;
boolean gameOver;
int runTime;
int display_state;
int level;
final int EASY = 0;
final int INTERMED = 1;
final int HARD = 2;
final int TITLE = 0;
final int SETTINGS = 1;
final int GAME = 2;
PImage title_art;
PImage mine;

void setup() {
  size( 1000, 600 );
  _boardA = new Tile[9][9];
  _boardB = new Tile[16][16];
  _boardC = new Tile[30][16];
  gameOver = false;
  runTime = 0;
  level = EASY;
  title_art = loadImage( "title_art.jpg" );
  mine = loadImage( "mine_balloon.png" );
  display_state = TITLE;
}

void draw() {
  if( display_state == TITLE ) {
    titleDisplay();
  }
  if( display_state == SETTINGS ) {
    settingsDisplay();
  }
  if( display_state == GAME ) {
    gameDisplay();
  }
}

/*---------------------------------------------------------
  ******************* DISPLAY FUNCTIONS *******************
  ---------------------------------------------------------*/

void titleDisplay() {
  background(255);
  image( title_art, 1190, 670 );
}

void settingsDisplay() {
}

void gameDisplay() {
}

/*---------------------------------------------------------
  ********************* GAME FUNCTIONS ********************
  ---------------------------------------------------------*/

void reveal( Tile toReveal ) {
}

void reset() {
}

void populate( int numBombs ) {
}

/*---------------------------------------------------------
  ******************** HELPER FUNCTIONS *******************
  ---------------------------------------------------------*/