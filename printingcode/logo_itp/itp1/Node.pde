//base class for grids

class Node {
  
   float x, y; //coordinates of the nodes
   float rotation;
   float prob; 
   float w; //cellsize
   
   Node ( float _x, float _y, float _w) {
      x = _x;
      y = _y;    
      prob = random(0, 2);
      w = _w;
   }
   
   void generate() {
     prob = random(0, 2);
   }
   
   void render() {
       if ( prob > 0.5 ) {
     fill(0); 
     noStroke();
     }
     else { 
     noFill();
     stroke (0);
     }
     
     if ( prob > 1 )   drawRect();
     else if ( prob <= 1) {
       drawTriangle();
     }
     
   }
   void  drawTriangle () {
    
    
     
     if ( prob < 0.25 ) {
     triangle (x, y, x+w, y, x, y+w);
     }
     else if ( prob > 0.25 && prob < 0.5 ) {
       triangle (x, y, x+w, y, x+w, y+w);
     }
     else if ( prob > 0.5 && prob < 0.8) {
       triangle (x, y, x, y+w, x+w, y+w);
     }
     else if ( prob > 0.8 && prob < 1) {
       triangle (x+w, y, x+w, y+w, x, y+w);
     }
   }
   
   void drawRect () {
        fill(0);
        noStroke();
        rect(x, y, w, w);
   }
     
   void setRotation(float r) {
        rotation= r;
   }
   
}
