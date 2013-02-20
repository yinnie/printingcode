/**
 * ColorTheory demo showing the following:
 * - application of ColorTheoryStrategies to create harmonious colorpalettes
 * - using the generated palettes to create additional shades
 * - sorting ColorLists
 *
 * Press any key to re-generate all with a random base TColor
 *
 * @author Karsten Schmidt <info at postspectacular dot com>
 */

/* 
 * Copyright (c) 2009 Karsten Schmidt
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;
float   SWATCH_HEIGHT;
float   SWATCH_WIDTH;
int     SWATCH_GAP;

float   MAX_SIZE = 150;
int     NUM_DISCS = 300;
TColor linecolor;
boolean showDiscs=true;

void setup() {
  size(1024, 768);
  colorMode(HSB, 1, 1, 1);
  noLoop();
  textFont(createFont("arial", 9));
  linecolor =  TColor.newHSV(0.6, 0.6, 0.9);;
}

void draw() {
  background(0);
  TColor col = ColorRange.SOFT.getColor();
  int yoff = 10;
  
  
  SWATCH_HEIGHT = random(200,768);
  SWATCH_WIDTH = random(5, 200);
     SWATCH_GAP = 0;
 
   ColorTheoryStrategy s = new TriadTheoryStrategy();
   
    ColorList list = ColorList.createUsingStrategy(s, col);
   // swatches(list, 0, yoff);
    list=new ColorRange(list).addBrightnessRange(0,0.6).getColors(null,500,0.9);
    list.sortByDistance(false);
    swatches(list,0,yoff);

  }


void keyPressed() {
  redraw();
}


void swatch(TColor c, int x, int y) {
  fill(c.toARGB());
  stroke(linecolor.toARGB());
  strokeWeight(0.6);
  //noStroke();
  //ellipse(width/2, height/2, SWATCH_WIDTH, SWATCH_WIDTH);
  rect(x, y, SWATCH_WIDTH, SWATCH_HEIGHT);
}

void swatches(ColorList sorted, int x, int y) {
  noStroke();
  for (int i = 0; i < sorted.size(); i++) {
    TColor c = sorted.get(i);
    SWATCH_WIDTH = 500;
    swatch(c, x, y);
    SWATCH_HEIGHT = 6;

    y += SWATCH_HEIGHT + SWATCH_GAP;
  }
}

