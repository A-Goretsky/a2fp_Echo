Tile[][] _easyBoard; //easy board
Tile[][] _medBoard;  //intermediate board
Tile[][] _hardBoard; //hard board
boolean gameOver;
int display_state;
int level;
int fromStart = null;
int currTime; //tis the time to display
int numRevealed;
final int EASY = 0;
final int INTERMED = 1;
final int HARD = 2;
final int TITLE = 0;
final int SETTINGS = 1;
final int GAME = 2;
final int RESET = 3;
final int GO_TO_TITLE = 4;
final int GO_TO_SETTINGS = 5;
final int GO_TO_GAME = 6;
final int CHANGE_TO_EASY = 7;
final int CHANGE_TO_MED = 8;
final int CHANGE_TO_HARD = 9;
final int START_GAME = 10;
final int GAME_OVER = 11;
PImage title_art;
PImage easyBoard;
PImage medBoard;
PImage hardBoard;
PImage tile;
PImage mine; //it's a balloon

void setup() {
  size( 1000, 600 );
  _easyBoard = new Tile[9][9];
  _medBoard  = new Tile[16][16];
  _hardBoard = new Tile[30][16];
  gameOver = false;
  level = EASY;
  title_art = loadImage( "title_art.jpg" );
  easyBoard = loadImage( "mineS_board_easy.png" );
  medBoard  = loadImage( "mineS_board_med.png" );
  hardBoard = loadImage( "mineS_board_hard.png" );
  tile = loadImage( "tile.png" );
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
    if (fromStart == null) {
      fromStart = (int) (millis() * .001);
    }
    gameDisplay();
  }
}

/*---------------------------------------------------------
  ******************* DISPLAY FUNCTIONS *******************
  ---------------------------------------------------------*/

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  displays title and creds, 
  bomb-ass title art, and start button
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void titleDisplay() {
  background(255);
  image( title_art );
  Button go = new Button( 500, 300, #FF0000, "YEA BBY", GO_TO_SETTINGS );
  go.display();
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  displays the settings, includeing:
    - level selection buttons
  also start button
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void settingsDisplay() {
  backgroud(255);
  
  //*****BUTTONS******
  Button easy = new Button( 300, 300, #FF0000, "UH", CHANGE_TO_EASY );
  Button med  = new Button( 400, 300, #FF0000, "YE", CHANGE_TO_MED );
  Button hard = new Button( 500, 300, #FF0000, "BBY", CHANGE_TO_HARD );
  Button start = new Button( 400, 400, #FF0000, "LEGGO", GO_TO_GAME );
  
  //*****SELECTION*****
  
  //if any of the buttons are clicked, do the button action
  if( mousePressed() ) {
  
    //set level & populate small board
    if( easy.isInside( mouseX, mouseY ) ) { 
      easy.act(); 
      
      //set level & populate med board
    } else if( med.isInside( mouseX, mouseY ) ) { 
      med.act();
      
      //set level & populate large board
    } else if( hard.isInside( mouseX, mouseY ) ) {
      hard.act();
      
      //change state to GAME and start timer
    } else if( start.isInside( mouseX, mouseY ) ) {
      start.act();
    }
  }
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  displays the actual game, including:
    - board
    - reset button
    - running time / points
  bomb-ass title art, and start button
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void gameDisplay() {
  //timer
  currTime = ( (int) ( millis() * .001 ) ) - fromStart;
  if( level == EASY ) {
    image( easyBoard, 20, 20 );
  }
  if( level == INTERMED ) {
    image( medBoard, 20, 20 );
  }
  if( level == HARD ) {
    image( hardBoard, 20, 20 );
  }
  
  fill( #FF0000 );
  text( currTime.toString() + "THIS IS CURRTIME", 300, 20 );
  
}

/*---------------------------------------------------------
  ********************* GAME FUNCTIONS ********************
  ---------------------------------------------------------*/

void reveal( Tile toReveal ) {
  if (numRevealed == 0) {
    if (level == EASY) {
      populate(10, //need coords of current click to know which tile to populate around)
    }
    if (level == INTERMED) {
      populate(40, //need coords of current click to know which tile to populate around)
    }
    if (level == HARD) {
      populate(99, //need coords of current click to know which tile to populate around)
    }
  }
  //actual tile reveal code here
  numRevealed++;
}

void populate( int numBombs, Tile firstRevealed ) {
  if (level == EASY) {
    for (int x = 0; x < board.length)
  }
  if (level == INTERMED) {
    
  }
  if (level == HARD) {
    
  }
}

/*---------------------------------------------------------
  ******************** HELPER FUNCTIONS *******************
  ---------------------------------------------------------*/