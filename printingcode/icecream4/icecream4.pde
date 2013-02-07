//work for rune madsen printing code class
//assignment #1. an ice cream cone design while using triangle, rectangle and ellipse functions once each only

import processing.pdf.* ;
float centerx;
float centery;
float paperwidth = 8.3; //inches
float paperheight = 11.7; 
int enlargefactor = 60;

void setup() {
  size( (int)paperwidth*enlargefactor, (int)paperheight*enlargefactor );
  smooth();
  centerx = width/2;
  centery = height/2;
  
  beginRecord(PDF, "icecream.pdf");
  background(0);
  stroke(255);
  translate(centerx+120, centery+70);
  scale(0.7);

  //top
  ellipse(3, -32, 14, 14);

  //ice cream 
  pushMatrix();
  rotate(radians(23));
  for ( int i = 0; i < 7; i++ ) {
    rotate(radians(-1.5));
    rectMode(CENTER); 
    rect(-2+i*1, -10+21*i, 40+i*9, 11, 20);
  }
  popMatrix();

  //cone
  pushStyle();
  noFill();
  strokeWeight(2);
  triangle(-59, 130, 14, 130, -18, 250);
  popStyle();
  
  endRecord();
}

