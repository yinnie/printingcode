// M_4_2_02.pde
// Attractor.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * a simple attractor
 *
 * MOUSE
 * left click, drag  : attract nodes
 *
 * KEYS
 * r                 : reset nodes
 * s                 : save png
 */

// imports
import generativedesign.*;
import processing.pdf.*;

// initial parameters
int xCount = 100;
int yCount = 100;
float gridSize = 600;

// nodes array 
Node[] myNodes = new Node[xCount*yCount];

// attractor
Attractor myAttractor;


// image output
boolean saveOneFrame = false;
boolean saveToPrint = false;


void setup() {  
  size(800,800); 

  // setup drawing parameters
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  background(255); 

  cursor(CROSS);

  // setup node grid
  initGrid();

  // setup attractor
  myAttractor = new Attractor(0, 0);
  myAttractor.strength = -10;
  myAttractor.ramp = 0.4;
}

void draw() {
  if (saveToPrint) {
    beginRecord(PDF, timestamp()+".pdf");
  }

  background(255);

  myAttractor.x = mouseX;
  myAttractor.y = mouseY;

  for (int i = 0; i < myNodes.length; i++) {
    if (mousePressed) {
      myAttractor.attract(myNodes[i]);
    }

    myNodes[i].update();

    // draw nodes

    if (saveToPrint) {
      noStroke();
      fill(0);
      ellipse(myNodes[i].x, myNodes[i].y, 1, 1);
    }
    else{
      stroke(0);
      point(myNodes[i].x, myNodes[i].y);
         
    }
  }
  
      //draw lines
      
      for ( int k =0; k < yCount; k+=4 ) {
        for ( int j = 1; j< xCount-1; j++) {
          int index = j + k*xCount;
          line(myNodes[index+1].x, myNodes[index+1].y, myNodes[index].x, myNodes[index].y);
        }
      }
      
          for ( int k =0; k < xCount; k+=4 ) {
        for ( int j = 1; j< yCount-1; j++) {
          int index = j + k*yCount;
          line(myNodes[index+1].x, myNodes[index+1].y, myNodes[index].x, myNodes[index].y);
        }
      }

  // image output
  if (saveToPrint) {
    saveToPrint = false;
    endRecord();
    println("saving to pdf – done");
  }

  if(saveOneFrame == true) {
    saveFrame(timestamp()+".png");
    saveOneFrame = false;
  }
}


void initGrid() {
  int i = 0; 
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      float xPos = x*(gridSize/(xCount-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(yCount-1))+(height-gridSize)/2;
      myNodes[i] = new Node(xPos, yPos);
      myNodes[i].setBoundary(0, 0, width, height);
      myNodes[i].setDamping(1.0);  //// 0.0 - 1.0
      i++;
    }
  }
}


void keyPressed(){
  if(key=='r' || key=='R') {
    initGrid();
  }

  if(key=='s' || key=='S') {
    saveOneFrame = true; 
  }
  if(key=='p' || key=='P') {
    saveToPrint = true; 
    saveOneFrame = true; 
    println("saving to pdf - starting (this may take some time)");
  }
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}









