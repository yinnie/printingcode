//work for printing code class taught by rune madsen
//assignment #1. an ice cream cone design while using triangle, rectangle and ellipse functions once each only

import processing.pdf.*;
float paperwidth = 8.3; //inches
float paperheight = 11.7; 
int enlargefactor = 60;

void setup() {
  size( (int)paperwidth*enlargefactor, (int)paperheight*enlargefactor );
  smooth();
  float centerx = width/2;
  float centery = height/2;
  
  beginRecord(PDF, "icecream.pdf");
  background(0);
  stroke(255);
  translate(centerx, centery);
  scale(0.9);

  //top
  ellipse(-3, -103, 17, 17);

  //ice cream 
  pushMatrix();
  rotate(radians(24));
  for ( int i = 0; i < 3; i++ ) {
    rotate(radians(-6));
    rectMode(CENTER); 
    rect(-21+i*6, -70+24*i, 60+i*28, 17, 20);
  }
  popMatrix();

  //cone
  noFill();
  strokeWeight(2);
  int x1 = -48;
  int x2 = 32;
  triangle(x1, -5, x2, -5, ( x1+(x2-x1)*0.5 ), 110);
  
  endRecord();
}

