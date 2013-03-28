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
       fill(0,250, 120, 50);
     ellipse(x + random(-20, 20), y+random(-20, 20), 0.1*s, 0.1*s);
   }
   
   void drawquad(float p, float q, float s) {
      // stroke(0,250, 70,76);
      stroke(0);
      strokeWeight(0.8);
     //top point of quad
     Vert v1 = new Vert ( new PVector(x+p, y-s+q));
     //bottom point of quad
     Vert v2 = new Vert ( new PVector (x+p, y+s+q));
     Line line1 = new Line(v1, s, -2.35);
     Line line2 = new Line(v1, s, -0.78);
     Line line3 = new Line(v2, s, 0.78);
      Line line4 = new Line(v2, s, 2.36);
      line1.drawline();
      line2.drawline();
            line4.drawline();
                  line4.drawline();
 /*       line(x-s+p, y+q, x+p, y+s+q);
       line(x+p, y+s+q, x+s+p, y+q);
       line(x+s+p, y+q, x+p, y+s+q);
       line(x+p, y+s+q, x-s+p, y+q);  */

   }
   
   void setRotation(float r) {
        rotation= r;
   }
   
}
