
class Cell {
  
  float locx; //left corner x
  float locy;//left corner y
  float w; //width of cell
  float h;
  
  
  Cell ( float _locx, float _locy, float _w, float _h) {
    locx = _locx;
    locy = _locy;
    w = _w;
    h = _h;
  }
  
  boolean checkInside ( float x, float y) {
    //check if there is a point x.y inside this cell
    if ( x > locx && x < locx + w && y > locy && y < locy + h ) {
      return true;
    }
    else return false;
    
  }
  
  void render() {
     fill(60);
  stroke(0, 60);

     rect(locx, locy, w, h);
  }
  
    void renderGrid() {
     noFill();
  stroke(0, 60);

     rect(locx, locy, w, h);
  }
  
  
   
}
