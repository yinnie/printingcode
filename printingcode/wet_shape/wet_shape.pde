//work for printing code class taught by rune madsen
//assignment #2. 

import processing.pdf.*;
float paperwidth = 17; //inches
float paperheight = 17; 
int enlargefactor = 40;

void setup() {
  size( (int)paperwidth*enlargefactor, (int)paperheight*enlargefactor );
  smooth();
  float centerx = width/2;
  float centery = height/2;

  beginRecord(PDF, "wettysharp.pdf");
  background(0);
  scale(1.1);
  //eye 
  translate(centerx+45, centery-125);
 
  pushMatrix();
  noFill();
  stroke(255);
  strokeWeight(10);
  for ( int numS = 0; numS < 5; numS++) {
    rotate(PI/2);
     beginShape();
    float r = 120 * (pow(0.45,numS));
    for ( int i =0; i < 5; i++) {
       float radius;
      if (i%2 ==0) radius = r*0.45;
      else radius = r; 
      vertex(cos(PI/2*i)*radius, sin(PI/2*i)*radius);
    }
     endShape();
  }
    popMatrix();
   
   scale(0.6);
    // //tear drop
    translate(150, 250); 
    //triangle on top 
    float Tdegrees = 360/3;
    pushMatrix();
    rotate(PI/4+radians(3));
    for ( int numT = 1; numT>-1; numT--) {
      int radiusT = 17 +40*numT;
      beginShape();
      pushMatrix();
      strokeWeight(1);
      if (numT==0) translate(-8, -15);
      if (numT == 1) fill(255);
      else fill(0);
      
      for ( int i = 0 ; i < 3; i++) {
        vertex(cos(radians(i*Tdegrees/4*3))*radiusT, sin(radians(Tdegrees*i))*radiusT);
      }
      endShape();
      popMatrix();
    }
    popMatrix();
    //circle on bottom
    translate(0, 41);
    beginShape();
    fill(255);
    for ( int i = 0; i< 85; i++) {
      float Cdegrees = 360/80;
      float radius = 37;
      curveVertex(cos(radians(i*Cdegrees))*radius, sin(radians(Cdegrees*i))*radius);
    }
    endShape();








    endRecord();
  }

