//this class contains all the two-dimensional shapes that we want to draw
//we use processing's innate geometry primitives but generalize the parameters so we can use them with more flexibility
//assuming all shapes drawn in a square of 300 by 300
class TShape {

  int drawType;  //the chosen shape type to draw
  int unitLength = 150;
  int startX = 50;
  int startY = 50;
  int gridSize = 300;
  int numShapes = 14;
  
  TShape() {
    drawType = (int)random(numShapes);
  }

  void generate() {
       drawType = (int)random(numShapes);
  }    

  void render() {
    strokeWeight(12);
    switch ( drawType) {
      case(0):
      triangle (startX-unitLength*0.35, startY+unitLength/4, startX, startY, startX+unitLength*0.3, startY+unitLength*0.5);
      break;
     
    }
  }
}

