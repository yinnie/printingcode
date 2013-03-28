//separating the radical class as a sub-class of Nodebase so that we can allow some Nodebases
//to have a radical (TShape) and some Nodebases to have no actual radicals but children that have radicals.
//basically all nodes are part of the tree structure but if some branches have children it means they themselves have no rdicals to draw.
//all the drawing of the radicals are done in this class

class Radical extends Nodebase {

  PVector mScale, mRotation, mPosition;
  TShape mShape;

  Radical() {
    super();
    mScale = new PVector (1.0, 1.0);
    mPosition = new PVector (0.0, 0.0);
    mRotation = new PVector (0.0, 0.0);
    mShape = new TShape();
  }
  void setShape(TShape _shape) {
    mShape = _shape;
  }
  

  void setScale(PVector _scale) {
    mScale.set( _scale);
  }

  void setPosition(PVector _value) {
    mPosition.set(_value);
  }

  void setRotation(PVector _value) {
    mRotation.set(_value);
  }

  void draw() {  

    pushMatrix();
    translate(mPosition.x, mPosition.y);
    scale(mScale.x, mScale.y);
    
    if ( mShape!= null ) {
      mShape.render();
     }  
    popMatrix();
  }
  
  void generate() {
    mShape.generate();
  }
 
}

