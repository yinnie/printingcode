//logo design. tangram inspired. drag and group into your own shape; then press space bar to cycle through color choices
import geomerative.*;
import processing.pdf.*;

Shape[] shapes;
int total = 5;
PVector mouse;
//gap between each shape
int stepx, stepy;
//lock on selection to make sure at one time only one shape can be selected
boolean lock;
boolean recording;
//tracking millis..used for record
int m; 
PGraphicsPDF pdf;

void setup() {

  size(800, 600);
  pdf = (PGraphicsPDF) createGraphics(200, 200, PDF, "out.pdf");
  smooth();
  mouse = new PVector (0, 0);
  stepx = 100;
  stepy = 400;
  lock = false;
  shapes = new Shape[total];  
  RG.init(this); //init geomerative library 
  for ( int i= 0; i < total; i++) {
    PVector p = new PVector (50+i*stepx, stepy);
    String s = "shape" + (i+1) + ".svg";
    shapes[i] = new Shape();
    shapes[i].mshape = RG.loadShape(s) ;
    //shapes[i].mshape = RG.centerIn(shapes[i].mshape,g);  
    shapes[i].setScale(new PVector(0.5, 0.5));
    shapes[i].setLocation(p);
  }
}

void draw() {
  
  background(255); 
  //update our mouse
  mouse.set(new PVector(mouseX, mouseY));
  //draw the box
  noFill();
  stroke(0);
  strokeWeight(0.5);
  rect(-5,-5, 205, 205);
 
  for ( int i= 0; i < total; i++) {
    shapes[i].render();
    if (keyPressed) {
      if(key==CODED) {
      if (keyCode == RIGHT) {
        shapes[i].setRotation(0.05);
       }
       if(keyCode == LEFT) {
         shapes[i].setRotation(-0.05);
       }
     }
    }
  }
  
  checkToEndRecording();
}

void mouseDragged() {
  //use one for loop to check all the shapes when mouseDragged ..which one is selected
  for ( int i= 0; i < total; i++) {
    //first check if something is selected already
    if (lock == false) {
      //check is mouse is inside shape
      shapes[i].checkInside(mouse);
      //if a shape is already selected..stop looping through other shapes
      if ( shapes[i].selected == true) {
        lock = true;
      }
    }
  }
  //use another for loop to update locations..locatons need to be constantly updated while mouseDragged is true
  for ( int i= 0; i < total; i++) {
    shapes[i].updateLocation(mouse);
  
  }
}

void mouseReleased() {
  //turn all 'selected' to false when mouse is released
  for ( int i= 0; i < total; i++) {      
    shapes[i].selected = false;
  }   
  //unlock all shapes ..all are open for selection
  lock = false;
}    

void checkToEndRecording() {
   if( (millis() -m) > 1000) {
      endRecord();
      println("recoding STOPPED!");
    }
}

void keyPressed() {
  switch(key) {
  case 'c': 
    //reset
    for ( int i = 0; i < total; i++) {
      PVector p = new PVector (50+i*stepx, stepy);
      shapes[i].setLocation(p);
    }
    break;
  case 'r' :
     m = millis();
    beginRecord(pdf);
    println("RECORDING START");
     break;
  } 
   

}

