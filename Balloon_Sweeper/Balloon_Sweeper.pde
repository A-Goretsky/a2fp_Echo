Tile[][] board;
boolean gameOver;
int display_state;
int level;
int fromStart = null;
int currTime; //tis the time to display
int numRevealed;
String[] scores;
final int EASY = 0; //board is 9x9 with 10 bombs
final int INTERMED = 1; //board is 16x16 with 40 bombs
final int HARD = 2; //board is 30x16 with 99 bombs
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
PImage flag;
PImage mine; //it's a balloon

void setup() {
  size( 1000, 600 );
  gameOver = false;
  level = EASY;
  board = new Tile[9][9];
  title_art = loadImage( "title_art.jpg" );
  easyBoard = loadImage( "mineS_board_easy.png" );
  medBoard  = loadImage( "mineS_board_med.png" );
  hardBoard = loadImage( "mineS_board_hard.png" );
  tile = loadImage( "tile.png" );
  flag = loadImage( "mineS_flag.png" );
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
      scores = loadStrings(scores.txt);
    }
    gameDisplay();
  }
  if (display_state == GAME_OVER) {
    endDisplay();
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
  Button easy = new Button( 265, 340, #FF0000, "EASY", CHANGE_TO_EASY );
  Button med  = new Button( 455, 342, #FF0000, "MEDIUM", CHANGE_TO_MED );
  Button hard = new Button( 665, 340, #FF0000, "HARD", CHANGE_TO_HARD );
  Button start = new Button( 458, 442, #FF0000, "START", GO_TO_GAME );
  
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
    
    else if (start.isInside( mouseX, mouseY) ) {
      reset.act();
    }
    
    else if( ) {
      //check if tile has already been revealed
      if (!(tile.isRevealed)) {
        //reveal or flad tile based on left or right click respectively
        if (mouseButton == RIGHT) {
          //flag stuff happens
        }
        else {
          reveal(/*tile*/);
        }
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
    
  //*****BOARD*****
  if( level == EASY ) {
    image( easyBoard, 200, 200, 320, 320 );
  }
  if( level == INTERMED ) {
    image( medBoard, 200, 200, 320, 320 );
  }
  if( level == HARD ) {
    image( hardBoard, 80, 200, 560, 307 );
  }
    
  //*****TIME*****
  fill( #000000 );
  strokeWeight( 5 );
  textSize( 60 );
  text( currTime, 260, 180 );
  
  //*****BUTTONS*****
  Button reset = new Button( 690, 290, #FF0000, "RESET", RESET );
  Button to_settings = new Button( 690, 290, #0066ff, "SETTINGS", GO_TO_SETTINGS );
  
  reset.display();
  to_settings.display();
}

void endDisplay() {
  //reveal all tiles
  for (int x = 0; x < board.length(); x++) {
    for (int y = 0; x < board[0].length; x++) {
      reveal(board[x][y]);
    }
  }
  //display of game over screen
  fill( #ff0000 );
  strokeWeight( 5 );
  textSize( 80 );
  text( "GAME OVER", 275, 300 );
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
    //save scores to external file
    String temp = str(currTime);
    String[] bla = {temp}
    saveStrings("scores.txt", bla);
    display_state = GAME_OVER; //explode bomb and game over
  }
  numRevealed++;
}

void populate( int numBombs, int firstTileRow, int firstTileCol) {
  //while we still need to place more bombs
  while (numBombs != 0) {
  
    //select a random tile
    int tileRow = (int)(Math.random() * board.length);
    int tileCol = (int)(Math.random() * board[0].length);
    
    //if this tile is not the first tile clicked on or one of the tiles around it
    if (abs(firstTileRow - tileRow) < 2 && abs(firstTileCol - tileCol) < 2) {
    
      //make the tile a bomb
      board[tileRow][tileCol].setBombType(1);
      
      
      //increase the bombsNeighbors value of all of the tile's neighboring tiles
      if (tileRow != 0 && tileCol != 0) {
        board[tileRow-1][tileCol-1].incrementNeighbors();
      }
      if (tileRow != 0) {
        board[tileRow-1][tileCol].incrementNeighbors();
      }
      if (tileRow != 0 && tileCol != board[0].length-1) {
        board[tileRow-1][tileCol+1].incrementNeighbors();
      }
      if (tileCol != board[0].length-1) {
        board[tileRow][tileCol+1].incrementNeighbors();
      }
      if (tileRow != board.length-1 && tileCol != board[0].length-1) {
        board[tileRow+1][tileCol+1].incrementNeighbors();
      }
      if (tileRow != board.length-1) {
        board[tileRow+1][tileCol].incrementNeighbors();
      }
      if (tileRow != board.length-1 && tileCol != 0) {
        board[tileRow+1][tileCol-1].incrementNeighbors();
      }
      if (tileCol != 0) {
        board[tileRow][tileCol-1].incrementNeighbors();
      }
      
      //decrease the number of bombs we need to place by 1
      numBombs--;
    }
  }
}