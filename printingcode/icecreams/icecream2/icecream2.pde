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
  translate(centerx, centery);
  scale(1.1);

  //top
  ellipse(5, -95, 18, 18);

  //ice cream 
  pushMatrix();
  rotate(radians(10));
  for ( int i = 0; i < 3; i++ ) {
    rectMode(CENTER); 
    rect(-10, -70+26*i, 80+i*26, 18, 120);
  }
  popMatrix();

  //cone
  pushStyle();
  noFill();
  strokeWeight(2);
  triangle(-62, -1, 42, -1, -8, 85);
  popStyle();
  
  endRecord();
}

