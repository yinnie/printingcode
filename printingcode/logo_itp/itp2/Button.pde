

class Button {
  
  float rectX, rectY;      // Position of square button
  int rectw,recth;     // Diameter of rect
  TColor rectColor;
  TColor rectColorover;
  boolean rectOver;
  
  
  Button(float locx, float locy) {
    rectX = locx;
    rectY = locy;
    rectw = 160;
    recth = 40;
    rectColor = TColor.newHSV(1, 0, 0.9);
    rectColorover = TColor.newHSV(1, 0, 0.78);
    rectOver = false;
    
  }
  
  boolean overRect()  {
  if (mouseX >= rectX && mouseX <= rectX+rectw && 
      mouseY >= rectY && mouseY <= rectY+recth) {
        rectOver = true;
    return true;
  } else {
    rectOver = false;
    return false;
  }
 }
 
 void render() {
   noStroke();
   if ( rectOver == true && mousePressed == true) {
     fill(rectColorover.toARGB()); }
     else { fill(rectColor.toARGB());}
   rect(rectX, rectY, rectw, recth);
 }
  
  
  
 
  
}
