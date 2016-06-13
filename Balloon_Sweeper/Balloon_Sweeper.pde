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
final int TITLE_TO_SETTINGS = 4;
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
  image( title_art, 0, 0 );
 
 //*****TEXT*****
 String title = "Balloon Sweeper";
 String creds = "By Leith Conybeare, Dylan Wright and Anton Goretsky";
  
 fill( #FF0000 );
 textSize( 60 );
 text( title, 500, 125 );
 
 fill( #000000 );
 textSize( 15 );
 text( creds, 550, 150 );
 
 Button title_to_settings = new Button( 800, 180, mine, 90, 142, "START", TITLE_TO_SETTINGS );
 title_to_settings.display();
 
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  displays the settings, includeing:
    - level selection buttons
  also start button
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void settingsDisplay() {
  background(255);
  
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
    } 
    
    //set level & populate med board
    else if( med.isInside( mouseX, mouseY ) ) { 
      med.act();
    }
    
    //set level & populate large board
    else if( hard.isInside( mouseX, mouseY ) ) {
      hard.act();
    }
    
    //change state to GAME and start timer
    else if( start.isInside( mouseX, mouseY ) ) {
      start.act();
    }
    
    //reveal or flad tile based on left or right click respectively
    else if( /*check if coords inside tile spaces*/) {
      if (tile.isRevealed)
      if (mouseButton == RIGHT) {
        //flag stuff happens
      }
      else {
        reveal(/*tile*/);
      }
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
    
    //*****BOARD*****
    image( easyBoard, 200, 200, 320, 320 );
    
    //*****TIME*****
    fill( #000000 );
    strokeWeight( 5 );
    textSize( 60 );
    text( currTime, 260, 180 );
    
    //*****BUTTONS*****
    Button reset = new Button( 690, 290, #FF0000, "RESET", RESET );
    Button to_settings = new Button( 690, 290, #0066ff, "SETTINGS", GO_TO_SETTINGS );
    
    reset.display();
    to_settings.display()
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
  //check if tile has already been revealed
  if (!(toReveal.isRevealed)) {
    if (toReveal.bombType == 0) {
      if (toReveal.bombNeighbors < 1) {
        //show empty tile 
        //reveal all tiles around tile - we need to write this
      }
      else {
        //show numbered tile
      }
    }
    else if (toReveal.bombType == 1) {
      //explode bomb and game over
    }
  numRevealed++;
  }
  //remember, it's specifically if bombNeighbors < 1, not if bombNeighbors = 0
}

void populate( int numBombs, int firstTileRow, int firstTileCol) {
  //while we still need to place more bombs
  while (numBombs != 0) {
    //select a random tile
    int tileRow = (int)(Math.random() * board.length());
    int tileCol = (int)(Math.random() * board[0].length());
    /*
    if the tile is not the first tile clicked on or one of the tiles around it
    make the tile a bomb
    increase the bombsNeighbors value of all of the tile's neighboring tiles
    and decrease the number of bombs we need to place by 1
    */
    if (abs(firstTileRow - tileRow) < 2 && abs(firstTileCol - tileCol) < 2) {
      tile[tileRow][tileCol].setBombType(1);
      if (tileRow != 0) {
        if (tileCol != 0) {
          
        }
      }
      numBombs--;
    }
  }
}

/*---------------------------------------------------------
  ******************** HELPER FUNCTIONS *******************
  ---------------------------------------------------------*/