//logo design. tangram inspired. drag and group into your own shape; then press space bar to cycle through color choices
import geomerative.*;

RShape[] shapes;
int total = 9;
PVector mouse = new PVector (mouseX, mouseY);

boolean selected = false;

void setup() {
  size(1024, 500);
  smooth();
  shapes = new RShape[total];
  
  RG.init(this); //init geomerative library
  
  for ( int i= 0; i < total; i++) {
    String s = "shape" + (i+1) + ".svg";
    shapes[i]= RG.loadShape(s) ;
  }
}

void draw() {
  
  background(255); 
  
   for ( int i= 0; i < total; i++) {
      
      pushMatrix();
      translate(i*100, 0);
      scale(0.5, 0.5);
       shapes[i].draw();
      popMatrix();
   }
 

   RPoint p = new RPoint(mouseX, mouseY);
   for ( int i= 0; i < total; i++) {
    if(shapes[i].contains(p)) {
      selected = true;
    }
    if(selected) {
       translate(mouseX, mouseY);
       //scale(0.5, 0.5);
       shapes[i].draw();
   }
   }
   
   
   
}
/*
void mousePressed() {
    for ( int i= 0; i < total; i++) {      
       shapes[i].checkInside(mouse);
    }
        
}

void mouseReleased() {
    for ( int i= 0; i < total; i++) {      
       shapes[i].selected = false;
    }
        
}   */
