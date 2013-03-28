import processing.pdf.*;

int cols = 41;
int rows = 41; 
int gridsize = 500;
float w, h;
float marginh, marginw;
int total; //total number of nodes

Node[] nodes;

void setup() 
{
  size(600, 800);
  
  smooth();
  //n+1 columnes of nodes....creating n gaps
  w = gridsize/(cols-1);
  h = gridsize/(rows-1);
  marginw =60;
  marginh =  120;
  //array of nodes
  total = cols * rows;
  nodes = new Node[total];
  createGrid();
  //beginRecord( PDF, "daofa.pdf");
  //endRecord();
  noLoop();
}

void draw() {
beginRecord( PDF, "covers.pdf");
background(250);
//stroke(0);
//rect(5, 5, width-5, height-5);
//draw border to indicate book
  for (int i = 0; i < total; i ++) {
    //nodes[i].drawpoints();
    float f = random(0, 1.0);
    float a = random(-2, 3);
    float b = random(-2, 3);
   nodes[i].drawquad(a, b, w*f);
  }

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
    
    //line(58, 617, 550, 617);
          textSize(24);
   fill(0, 90);
   text("Semiotics of Programming",width/3+42, 645);
    textSize(16);
   fill(0, 75);
   text("by KUMIKO TANAKA-ISHII",width/3+145, 710);
      endRecord();
}

void createGrid() {
  
    for ( int n = 0; n < total; n++) {
    for ( int i = 0; i < cols; i++) {
      for ( int j = 0; j < rows; j++) {
        nodes[n] = new Node ( marginw + i*w, marginh + j*h);
        n++;
      }
    }
  }
 
}

