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
  _boardA = new Tile[9][9];
  _boardB = new Tile[16][16];
  _boardC = new Tile[30][16];
  gameOver = false;
  runTime = 0;
  level = EASY;
  display_state = TITLE;
}

void draw() {
}

/*---------------------------------------------------------
  ******************* DISPLAY FUNCTIONS *******************
  ---------------------------------------------------------*/

void displayTitle() {
}

void displaySettings() {
}

void displayGame() {
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