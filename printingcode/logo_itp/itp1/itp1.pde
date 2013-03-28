import processing.pdf.*;

int cols = 3;
int rows = 3; 
float w;  //gridsize
float marginh, marginw;
int total; //total number of nodes

Node[] nodes;

void setup() 
{
  size(600, 800);
  smooth();
  
  w = 20;
  
  marginw = 50;
  marginh = 50;

  total = cols * rows;
  nodes = new Node[total];
  createGrid();

}

void draw() {
beginRecord( PDF, "covers.pdf");
background(250);


  for (int i = 0; i < total; i ++) {

   nodes[i].render();
 
  }
  /*
    for ( int j = 1; j < rows-1; j++) {
      for ( int i = 1; i < cols; i++) {
        float factorh = map(i, 1, rows*0.5, 0.4, 1);
        float factorh1 = map(i, rows*0.5, rows, 1, 0.4);
         float factorv = map(i, 1, cols*0.5, 0.4, 1);
        float factorv1 = map(i, cols*0.5, cols, 1, 0.4);
  float f = random(0, 1);
  if( f >0.7) {
        nodes[i+j*rows].drawcircle(w*factorh*factorh1*factorv*factorv1);
        //nodes[i+j*rows].drawcircle(w);
  }
      }
    } 
    */
   
      endRecord();
}

void generate() {

     for (int i = 0; i < total; i ++) {
      nodes[i].generate();
  }
}

void keyPressed() {
  if ( key == ' ') {
    generate();
  }
}

void createGrid() {
  
    for ( int n = 0; n < total; n++) {
    for ( int i = 0; i < cols; i++) {
      for ( int j = 0; j < rows; j++) {
        nodes[n] = new Node ( marginw + i*w, marginh + j*w, w);
        n++;
      }
    }
  }
 
}

