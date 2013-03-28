
class Nodebase {
  
  Nodebase parent;
  ArrayList<Nodebase> children;
  String name;
  boolean hasChildren;
  TShape mshape;

  
  Nodebase() {
    parent = null;  //default is root node
    name = "unnamed";
    children = new ArrayList();
    hasChildren = false;
    
    mshape = new TShape();
  }
  
  void addChild (Nodebase mChild) {
    mChild.setParent(this);
    children.add(mChild);
    hasChildren = true;
  }  
  
  void clear() {
    //remove all children
    for ( int i = 0; i < children.size(); i++){
      children.get(i).clear();
    }
     children.clear();
  }
  /*
  Nodebase getChild(int index) {
    if( index >= 0 && index < children.size() ) {
    return children.get(index);
    }
    else return null;
  }
  */
  int getChildCount() {
    return children.size();
  }
    
  void draw() {
    mshape.render();
  }  
 
  void generate() {
    mshape.generate();
  }
  
  void setParent(Nodebase mParent) {
      parent = mParent;
  }
  
  void setName(String _name) {
    name = _name;
  }
}
