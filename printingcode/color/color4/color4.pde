import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;
import processing.pdf.*;


int gridrows;
int gridcols;
float   SWATCH_HEIGHT = 100;
float   SWATCH_WIDTH = 100;
int     SWATCH_GAP = 0;

float   MAX_SIZE = 150;
int     NUM_DISCS = 300;
TColor linecolor;
boolean showDiscs=true;

void setup() {
  size(1024, 768);
  colorMode(HSB, 1, 1, 1);
  noLoop();
  textFont(createFont("arial", 9));
  linecolor =  TColor.newHSV(0.2, 0.05, 1);
  gridrows = (int) (height/SWATCH_HEIGHT) +1;
  gridcols = (int) (width/SWATCH_WIDTH) +1; 
}

void draw() {
   beginRecord(PDF, "colorportrait.pdf");
  background(0);
  TColor col = ColorRange.SOFT.getColor();
 
   ColorTheoryStrategy s = new TriadTheoryStrategy();
   
    ColorList list = ColorList.createUsingStrategy(s, col);
   // swatches(list, 0, yoff);
    //list=new ColorRange(list).addBrightnessRange(0.5,0.6).getColors(null,500,0.05);
    list=new ColorRange(list).getColors(null,500,0.05);
    list.sortByDistance(false);
    swatches(list,0,0);
   endRecord();
  }


void keyPressed() {
  redraw();
}


void swatch(TColor c, float x, float y) {
  fill(c.toARGB());
  
  strokeWeight(11);
  float p = random(0, 1);
  boolean draweye = false;
  boolean drawarc = false;
  if (p > 0.2 ) {
  noStroke();
  }
  else if (p < 0.2 && p > 0.08) {
  draweye = true;
  stroke(linecolor.toARGB());
  }
  else if ( p <= 0.08 ){
    draweye = true;
    drawarc = true;
  }
  
  float radius = SWATCH_WIDTH+ random(-35, 25);
  int n = (int)random(5,20);
  float angle = 360/n;
  beginShape();
  for ( int k = 0; k < n; k++) {
    vertex(x+cos(radians(angle*k))*radius+random(-30, 20), y+sin(radians(angle*k))*radius+random(-25, 14));
  }

    endShape();
   if(draweye) {
     fill(linecolor.toARGB());
     noStroke();
     ellipse(x-30, y, 20, 20);
   }

      
}

void swatches(ColorList sorted, int x, int y) {
  noStroke();
    for ( int i = 0; i < gridrows; i++) {
      for ( int j = 0; j<gridcols; j++) {
    TColor c = sorted.get((int)random(500));
    
    swatch(c, x+j*SWATCH_WIDTH, y+i*SWATCH_HEIGHT);

     }
    }
}

