//logo design. tangram inspired. drag and group into your own shape; then press space bar to cycle through color choices
import geomerative.*;
import processing.pdf.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.*;

Shape[] shapes;
int total = 5;
PVector mouse;
//gap between each shape
int stepx, stepy,buttonx, buttony;
//lock on selection to make sure at one time only one shape can be selected
boolean lock;
Button button, buttonpdf,buttonreset;
boolean recording;
//tracking millis..used for record
int m; 
int logosize;
PGraphicsPDF pdf;
int counter;
//arraylist of Tcolors
ArrayList colors; //normal use
ColorList mlist; //for use when camp
int numColors = 100; //num of colors in colorlist
boolean camp = false;

void setup() {

  size(700, 400);
  smooth();
  logosize = 300;
  counter = 0;
 
  mouse = new PVector (0, 0);
  stepx = 330;
  stepy = 78;
  lock = false;
  buttonx = stepx + 145;
  buttony = stepy+70;
  button = new Button(buttonx, buttony);
  buttonpdf = new Button(buttonx, buttony+70);
  buttonreset = new Button(buttonx, buttony+70*2);
  
  RG.init(this); //init geomerative library 
  RG.ignoreStyles();
  
  initShapes();
  initColors();
}

void draw() {
  
  TColor white = TColor.newHSV(0, 0, 1);
  TColor black = TColor.newHSV(0,1, 0);
  if ( camp) {
  background(black.toARGB());
  }
  else { background(white.toARGB()); }  
  button.render();
  buttonpdf.render();
  buttonreset.render();
  //update our mouse
  mouse.set(new PVector(mouseX, mouseY));
  //draw the box
  pushStyle();
  if (camp) {
    fill(white.toARGB());
  } else {
  fill(black.toARGB());
  }
  stroke(0);
  strokeWeight(0.5);
  rect(-2,-2, logosize+2, logosize+2);
  popStyle();
  
  randomSeed(100);
  for ( int i= 0; i < total; i++) { 
    RG.ignoreStyles();
    if(camp) {
      TColor fillcolor = mlist.get((int) random(numColors)); 
          fill(fillcolor.toARGB());
          noStroke();
      }
    else {TColor fillcolor = (TColor) colors.get(i); 
      fill(fillcolor.toARGB());
     noStroke();
   }
    shapes[i].render();
    
    if (keyPressed) {
      if(key==CODED) {
      if (keyCode == RIGHT) {
        shapes[i].setRotation(0.01);
       }
       if(keyCode == LEFT) {
         shapes[i].setRotation(-0.01);
       }
     }
    }
  }
  
  textSize(14);
  TColor t = TColor.newHSV(1, 0, 0.5);
  fill(t.toARGB());
  text("click and drag to make shapes", buttonx, buttony-70);
  text("Left Right arrow keys to rotate", buttonx, buttony-35);
  text("shuffle colors", buttonx+30, buttony+25);
  text("save pdf", buttonx+45, buttony+95);
  text("reset", buttonx+55, buttony+165);
  
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

void mousePressed() {
  //for button 
  if (button.overRect()) {
    if ( camp ) {
     initColors();
    }
    else {
    //shuffle colors in the arraylist
    Collections.shuffle(colors); }
  }
  if (buttonpdf.overRect()) { 
    m = millis();
    counter = counter + 1;
    pdf = (PGraphicsPDF) createGraphics(logosize, logosize, PDF, "frame"+ counter + ".pdf");
    println(counter);
    beginRecord(pdf);
  }
  if (buttonreset.overRect()) {
    for ( int i = 0; i < total; i++) {
      PVector p = new PVector (stepx,  10+i*stepy);
      shapes[i].setLocation(p);
    }
  }
}

void checkToEndRecording() {
   if( (millis() -m) > 500) {
      endRecord();
    }
}

void initColors() {
  colorMode(HSB, 1, 1, 1);
  colors = new ArrayList();
  
  TColor purple = TColor.newHSV( 0.76, 1, 1);
  TColor purple1 = TColor.newHSV( 0.86, 0.9, 0.7);
 
  TColor mgreen = TColor.newHSV(0.431,1.0,1);
  TColor mblue = TColor.newHSV(0.589,1.0,1.0);
  
  TColor yellow = TColor.newHSV(0.16,0.7, 1.0);
  TColor yellow1 = TColor.newHSV(0.1694, 1.0, 1.0);
 
  TColor mred = TColor.newHSV(0.99,1.0, 1.0);
  TColor mgreen1 = TColor.newHSV(0.3,1.0,1);
  
  TColor morange = TColor.newHSV(0.111,1.0, 1.0);
  TColor mpink = TColor.newHSV(0.942, 1.0, 1.0);
  
  if ( camp ) {
    ColorTheoryStrategy ss = new ComplementaryStrategy();
    mlist = ColorList.createUsingStrategy(ss, mgreen);
    mlist = new ColorRange(mlist).addBrightnessRange(0.8, 0.9).getColors(null, numColors, 0.9);
  }
  else {
  colors.add(mpink);
  colors.add(morange);
  colors.add(purple1);
  colors.add(yellow1);
  colors.add(mgreen);
  }
}

void initShapes() {
  
  shapes = new Shape[total];  
  for ( int i= 0; i < total; i++) {
    PVector p = new PVector (stepx, 10+i*stepy);
    String s = "shape" + (i+1) + ".svg";
    shapes[i] = new Shape();
    shapes[i].mshape = RG.loadShape(s) ;
    //shapes[i].mshape = RG.centerIn(shapes[i].mshape,g);  
    shapes[i].setScale(new PVector(1.0, 1.0));
    shapes[i].setLocation(p);
  }
}

void keyPressed() {
   if ( key == ' ') {
     camp = ! camp;
     initColors();
   }
}

