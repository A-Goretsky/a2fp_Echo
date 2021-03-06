class Tile {
  
  //------INSTANCE-VARIABLES------
  //boolean to check whether tile showing contents or not
  boolean isRevealed;
  
  //int to keep track of what type of tile the tile is 
  int bombType;
  
  //int to keep track of how many neighboring bombs a tile has
  int bombNeighbors;
  
  int xcoor;
  int ycoor;
  //------INSTANCE-VARIABLES------
  
  
  //------CONSTRUCTORS------
  //base constructor of a tile
  public Tile() {
    isRevealed = false;
    bombType = 0;
    bombNeighbors = 0;
  }
  
  //overloaded constructor to allow the creation of unique tiles
  public Tile(int newBombType) {
    this()
    bombType = newBombType;
  }
  
  
  //------METHODS------
  //method that allows Game to set tiles to be bombs 
  //used upon populating the board with bombs after the first mouseClick of the user
  public void setBombType(int newBombType) {
    bombType = newBombType;
  }
  
  //method that allows Game to increase a tile's count of bombs in neighboring tiles
  //used upon populating the board with bombs after the first mouseClick of the user
  public void incrementNeighbors() {
    if (bombNeighbors < 1) {
      bombNeighbors = 0;
    }
    bombNeighbors++;
  }
  
  public boolean isInside(float xcor, float ycor) {
    return abs(xcor - xcoor) < 40 && abs(ycor - ycoor) < 10;
  }
  
  public void setCoords(float xcor, float ycor) {
    xcoor = xcor;
    ycoor = ycor;
  }
  //------METHODS------
}