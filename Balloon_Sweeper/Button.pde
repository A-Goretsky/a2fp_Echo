class Button {
  float x, y;
  color c;
  String txt;
  int state;
  
  Button(float xcor, float ycor, color buttonColor, String txtDisplay, int stateInput) {
    x = xcor;
    y = ycor;
    c = buttonColor;
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
    GO_TO_TITLE
    GO_TO_SETTINGS
    GO_TO_GAME
    CHANGE_LEVEL
    START_GAME
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  void act() {
    if( state == RESET ) {
    }
    if( state == GO_TO_TITLE ) {
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
      return xcor > x - 40 && xcor < x + 40 && ycor > y - 10 && ycor < y + 10;
  }
  
  void display() {
    fill(c);
    noStroke();
    textSize(14);
    textAlign(CENTER, CENTER);
    text(txt, x, y);
  
}