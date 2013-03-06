import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;
import processing.pdf.*;


int gridrows;
int gridcols;
float   SWATCH_HEIGHT = 50;
float   SWATCH_WIDTH = 50;
int     SWATCH_GAP = 0;
float squarew, squareh;

TColor linecolor;
int numColors = 500;

void setup() {
  size(1024, 768);
  colorMode(HSB, 1, 1, 1);
  noLoop();
  textFont(createFont("arial", 9));
  linecolor =  TColor.newHSV(0.2, 0.05, 0.1);
  //gridrows = (int) (height/SWATCH_HEIGHT) +1;
  //gridcols = (int) (width/SWATCH_WIDTH) +1;
  gridrows = 2;
  gridcols = 2;
}

void draw() {
  beginRecord(PDF, "colorportrait.pdf");
  background(0);
  
  TColor col = ColorRange.SOFT.getColor();
  ColorTheoryStrategy ss = new ComplementaryStrategy();
  ColorList backgroundlist = ColorList.createUsingStrategy(ss, col);
  backgroundlist = new ColorRange(backgroundlist).addBrightnessRange(0, 0.6).getColors(null, numColors, 0.9);
  backgroundlist.sortByDistance(false);
 //draw horizontal strips
  squareswatches(backgroundlist, 0, 0);
  
  
  ColorTheme theme = new ColorTheme("testie");
  theme.addRange("fresh teal", 0.2);
  theme.addRange("bright yellowgreen", 0.1);

  FloatRange h = new FloatRange(0.1, 0.15);
  FloatRange s = new FloatRange(0.6, 0.9);
  FloatRange b = new FloatRange(0.6, 0.9);
  ColorRange range = new ColorRange(h, s, b, "My range");
  ReadonlyTColor c = NamedColor.getForName("orange");
  theme.addRange(range, c, 0.3);

  ColorList list = theme.getColors(numColors);

  list.sortByDistance(false);
 
  //draw the shape clusters 
  for( int q = 0; q < 7; q++) {
  swatches(list, random(width), random(height)); 
  }
  endRecord();
}


void keyPressed() {
  redraw();
}

void swatch(TColor c, float x, float y) {
 
//noFill();
  stroke(linecolor.toARGB());
  strokeWeight(0.4);
  float p = random(0, 1);
  boolean draweye = false;
  boolean drawarc = false;
  if (p > 0.5) {
     fill(c.toARGB());
    noStroke();
  }
  else if (p <= 0.5 && p > 0.3) {
     fill(c.toARGB());
    draweye = true;
    //stroke(linecolor.toARGB());
   // noStroke();
  }
  else if ( p <= 0.3 ) {
    noFill();
    draweye = true;
    drawarc = true;
  }

  float radius = SWATCH_WIDTH+ random(-15, 15);
  int n = (int)random(5, 20);
  float angle = 360/n;
  beginShape();
  for ( int k = 0; k < n; k++) {
    vertex(x+cos(radians(angle*k))*radius+random(-10, 10), y+sin(radians(angle*k))*radius+random(-15, 14));
  }

  endShape();
  if (draweye) {
    fill(linecolor.toARGB());
    noStroke();
    ellipse(x-30, y, 10, 10);
  }
}

void swatches(ColorList sorted, float x, float  y) {
  noStroke();
  for ( int i = 0; i < gridrows; i++) {
    for ( int j = 0; j<gridcols; j++) {
      TColor c = sorted.get((int)random(numColors));

      swatch(c, x+j*SWATCH_WIDTH, y+i*SWATCH_HEIGHT);
    }
  }
}

void squareswatches(ColorList sorted, int x, int y) {
  noStroke();
  for (int i = 0; i < numColors; i++) {
    TColor c = sorted.get(i);
    squarew = width;
    squareswatch(c, x, y);
    squareh = 6;
    y += squareh;
  }
}

void squareswatch(TColor c, int x, int y) {
  fill(c.toARGB());
  TColor tc = TColor.newHSV(0.2, 0.6, 0.9);
  stroke(tc.toARGB());
  strokeWeight(0.6);
  rect(x, y, squarew, squareh);
}

