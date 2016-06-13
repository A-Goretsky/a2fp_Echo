class Button {
  float x, y;
  color c;
  String txt;
  int type;
  
  Button(float xcor, float ycor, color buttonColor, String txtDisplay, int typeInput) {
    x = xcor;
    y = ycor;
    c = buttonColor;
    txt = txtDisplay;
    type = typeInput;
  }
  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  does the button action based on the button type,  
  i.e. if type = RESET, sets the state of the main
  class to RESET so that the game does the thing
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  void act() {
  }
  
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    returns true if the mouse coords (xcor and ycor)
    are within the bounds of the button, defined
    by the x,y position + the dimensions of the button
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  boolean isInside( float xcor, float ycor ) {
    if( type == TITLE ) {
      //for the title screen button
    }
    if( type == 
  }
  
  void display() {
    fill(c);
    noStroke();
    textSize(14);
    textAlign(CENTER, CENTER);
    text(txt, x, y);
    }
  
}