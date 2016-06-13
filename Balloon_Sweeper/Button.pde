class Button {
  float x, y;
  color c;
  int height;
  int width;
  buttImage;
  String txt;
  int state;
  
  Button(float xcor, float ycor, color buttonColor, String txtDisplay, int stateInput) {
    x = xcor;
    y = ycor;
    c = buttonColor;
    txt = txtDisplay;
    state = stateInput;
  }
  
  Button(float xcor, float ycor, PImage buttonImage, int imgHeight, int imgWidth, String txtDisplay, int stateInput) {
    x = xcor;
    y = ycor;
    height = imgHeight;
    width = imgWidth;
    buttImage = buttonImage;
    txt = txtDisplay;
    state = stateInput;
  }
  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  does the button action based on the state
  of the game (aka the type of button, when
  the button is pressed the game goes into a 
  "state" of doing the button action)
  i.e. if the state is RESET, then the button 
  action resets the game
  
  button-relevant states:
    RESET
    TITLE_TO_SETTINGS
    GO_TO_SETTINGS
    GO_TO_GAME
    CHANGE_LEVEL
    START_GAME
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  void act() {
    if( state == RESET ) {
      //reset everything back to defaults.
      fromStart = null;
      currTime = null;
      numRevealed = 0;
      setup();
    }
    if( state == TITLE_TO_SETTINGS ) {
      display_state = TITLE;
    }
    if( state == GO_TO_SETTINGS ) {
      display_state = SETTINGS;
    }
    if( state == GO_TO_GAME ) {
      display_state = GAME;
    }
    if( state == CHANGE_TO_EASY ) {
      level == EASY;
    }
   if( state == CHANGE_TO_MED ) {
      level == INTERMED;
    }
    if( state == CHANGE_TO_HARD ) {
      level == HARD;
    }
  }
  
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    returns true if the mouse coords (xcor and ycor)
    are within the bounds of the button, defined
    by the x,y position + the dimensions of the button
    (coords of rect defined but upper-left point)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  boolean isInside( float xcor, float ycor ) {
    return abs(xcor - x) < 40 && abs(ycor - y) < 10;
    //return xcor > x - 40 && xcor < x + 40 && ycor > y - 10 && ycor < y + 10;
  }
  
  void display() {
    if( state == TITLE_TO_SETTINGS ) {
       image( buttImage, x, y, height, width );
       textSize( 25 );
       strokeWeight( 5 );
       text( txt, 807, 245 );
    }
    if( state == RESET ) {
      //button
      fill( c );
      stroke( #cc0000 );
      strokeWeight( 2 );
      rect( x, y, 110, 40 );
      
      //text
      fill( #000000 );
      strokeWeight( 5 );
      textSize( 35 );
      text( "RESET", x + 5, y + 33 );
    }
    if( state == GO_TO_SETTINGS ) {
      //button
      fill( c );
      stroke( #0033cc );
      strokeWeight( 2 );
      rect( x, y, 110, 40 );
      
      //text
      fill( #000000 );
      strokeWeight( 5 );
      textSize( 20 );
      text( "SETTINGS", 698, 378 );
    }
    if( state == CHANGE_TO_EASY ) {
      fill( #0066ff );
      stroke( #0033cc );
      strokeWeight( 2 );
      rect( 250, 310, 110, 40 );
      
      fill( #000000 );
      noStroke();
      textSize( 30 );
      text( "EASY", 265, 340 );
    }
    if( state == CHANGE_TO_MED ) {
      fill( #0066ff );
      stroke( #0033cc );
      strokeWeight( 2 );
      rect( 450, 310, 110, 40 );
      
      fill( #000000 );
      noStroke();
      textSize( 26 );
      text( "MEDIUM", 455, 342 );
    }
    if( state == CHANGE_TO_HARD ) {
      fill( #0066ff );
      stroke( #0033cc );
      strokeWeight( 2 );
      rect( 650, 310, 110, 40 );
      
      fill( #000000 );
      noStroke();
      textSize( 30 );
      text( "HARD", 665, 340 );
    }
    if( state == START_GAME ) {
      fill( #00cc00 );
      stroke( #009933 );
      rect( 450, 410, 110, 40 );
  
      fill( #000000 );
      noStroke();
      textSize( 30 );
      text( "HARD", 665, 340 );
      text( "START", 458, 442 );
    }
  
}