//base class for grids

class Node {
  
   float x, y; //coordinates of the nodes
   int radius; //how big is the neighbourhood affected
   float rotation;
   
   Node ( float _x, float _y) {
      x = _x;
      y = _y;    
   }
   
   void  drawtriangle(float s) {
     pushMatrix();
     //fill(0,255, 0,50);
    // noStroke();
     noFill();
     strokeWeight(0.6);
     stroke(0,250, 120,67);
     triangle(x-s, y+s*2, x, y, x+s, y+s*2);
      popMatrix();
   }
   
   void drawpoints() {
    
 
      strokeWeight(0.5);
      ellipse(x,y, 1,1);
   }
   
   void drawcircle(float s) {
       fill(0,250, 170, 70);
     ellipse(x + random(-20, 20), y+random(-20, 20), 0.1*s, 0.1*s);
   }
   
      void drawquad(float p, float q, float s) {
       stroke(0,250, 120);
      strokeWeight(0.8);
       //   noFill();
       line(x-s+p, y+q, x+p, y+s+q);
       line(x+p, y+s+q, x+s+p, y+q);
       line(x+s+p, y+q, x+p, y+s+q);
       line(x+p, y+s+q, x-s+p, y+q);

   }
   
   void setRotation(float r) {
        rotation= r;
   }
   
}
