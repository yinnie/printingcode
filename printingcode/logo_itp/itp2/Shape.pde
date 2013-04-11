//container class for RShape

class Shape {
  
    PVector loc;
    float mrotation;
    PVector mscale;
    RShape mshape; 
    boolean selected;
    
    Shape () {
      loc = new PVector ( 0, 0);
      mrotation = 0.0;
      mscale = new PVector(1.0, 1.0);
      mshape = new RShape(); //initiate empty rshape
      selected =false;
    }
    
    void render() {
      pushMatrix();
      translate(loc.x, loc.y);
      scale(mscale.x, mscale.y);
      rotate(mrotation);
      mshape.draw();
      popMatrix();
    }
    
    void setLocation ( PVector _loc) {
      loc.set(_loc);
    }
    
    void setScale ( PVector _scale) {
      mscale.set( _scale);
    }
    
    void setRotation ( float _rotate) {
      if ( selected) {
      mrotation = _rotate;
      }
    }
    //check if a point is inside
    void checkInside (PVector checkpoint) {
       RPoint p = new RPoint ( checkpoint.x - loc.x, checkpoint.y - loc.y);
       if ( mshape.contains(p) ) {
         selected = true;
       }
    }
    
    void updateLocation (PVector newlocation) {
      if ( selected ) {
         setLocation(newlocation);
      }
    }
    
    
  
  
  
}
