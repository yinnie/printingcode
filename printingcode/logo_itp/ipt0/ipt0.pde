//ways to compose symbols according to set structures/frameworks
//structures to choose from:  a. top/down  b. top/middle/bottom c. left/right d. left/middle/right

ArrayList<Radical> roots;
ArrayList<TShape> shapes;

int cols = 4;
int rows = 4;
int marginH = 50;
int marginV = 50;

int cellSize = 250;
float baseScale = 0.25;

int numShapes = 14; //total number of radicals draw types

void setup() {
  int appWidth = int(cols * cellSize * baseScale);
  int appHeight = int(rows * cellSize * baseScale);
  println( "appWidth: " + appWidth + "\tappHeight: " + appHeight );  
  size( appWidth + marginH *2, appHeight + marginV*2 );
  smooth(); 

  roots = new ArrayList();

  int total = cols*rows;

  for ( int i = 0; i < total; i++) {
    Radical root = new Radical();
    roots.add(root);
  }
}

void draw() {

  background(255);

  scale(baseScale);

  pushMatrix();
  strokeWeight(20);
  for ( int j = 0; j < rows; j++) { 
    for ( int i = 0 ; i < cols; i++) {
      roots.get(i+i*j).setPosition(new PVector (marginH +i*cellSize, marginV +j*cellSize)); 
      roots.get(i+i*j).draw();
    }
  }
  popMatrix();
}

void keyPressed() {
  if ( key == 's' )
    saveFrame();
}

void mousePressed() {

  for ( int j = 0; j < rows; j++) {         
    for ( int i = 0 ; i < cols; i++) {
      roots.get(i+i*j).generate();
    }
  }
}




