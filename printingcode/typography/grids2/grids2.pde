import geomerative.*;
import processing.pdf.*;

void setup() 
{
  size(600, 400);
  background(255);
  smooth();
  
  int fontSize = 200;
  
  // initialize the geomerative library
  RG.init(this);
  
  // create a new font
  RFont font = new RFont("wt006.ttf", fontSize, RFont.CENTER);

  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(8);
  
  // get the points on font outline.
  RGroup grp, grp0;
  grp = font.toGroup("年");
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();
  grp0 = font.toGroup("糕");
  grp0 = grp0.toPolygonGroup();
  RPoint[] pnts0 = grp0.getPoints();
  
  beginRecord( PDF, "daofa.pdf");
  //good combinations:  20/60 for both with pixel 12 or 11 or 10
  //17/18 for both with pixel 10
  
  //first character
  pushMatrix();
  translate(width/2-130, height/2+50); 
  //because of the way typographs are displayed, we need offset to draw the grid aligned with the word 
  float offsetx = -90;
  float offsety = -160;
  // good pairs.. 24/17; 22/18; 21/17; 20/17; 13/18(pixel 11); 10/18; 9/16, 20/60, 13/50 ( pixel length 10 + 20/60), 13/18(pixel 15), 13/60(pixel 15)
  // good for 'fa'   21/12  10/10  25/23  15/30(very irregular), 20/40 , 20/60
  int col = 13;
  int row = 24;
  //grid cell width
  float w = fontSize/col;
  float h = fontSize/row;
   
 

  for (int i = 0; i < pnts.length/3; i++ ) 
  { 
    //draw the points
    //rect(pnts[i].x, pnts[i].y, 2, 2);
    //get the coordinates of the points
    float x = pnts[i].x;
    float y = pnts[i].y;
      
      //make new cells
       for ( int  p = 0; p < col; p ++ ) {
         for ( int q = 0; q < row; q ++ ) {
           Cell newcell = new Cell( p*w + offsetx, q*h + offsety, w, h);
           //for each point, check against the current cell
           if ( newcell.checkInside (x, y))  {
          
             newcell.render();
           }
         }
       }                  
  }
  
   for (int i = pnts.length*5/6; i < pnts.length; i++ ) 
  { 
    //draw the points
    //rect(pnts[i].x, pnts[i].y, 2, 2);
    //get the coordinates of the points
    float x = pnts[i].x;
    float y = pnts[i].y;
      
      //make new cells
       for ( int  p = 0; p < col; p ++ ) {
         for ( int q = 0; q < row; q ++ ) {
           Cell newcell = new Cell( p*w + offsetx, q*h + offsety, w, h);
           //for each point, check against the current cell
           if ( newcell.checkInside (x, y))  {
          
             newcell.render();
           }
         }
       }                  
  }
  popMatrix();
  
  // second character 
  pushMatrix();
  translate(width/2+75, height/2 + 50); 
  //because of the way typographs are displayed, we need offset to draw the grid aligned with the word 
  // good pairs.. 24/17; 22/18; 21/17; 20/17; 13/18(pixel 11); 10/18; 9/16, 20/60,  ( pixel length 10 + 20/60), 13/18(pixel 15), 13/60(pixel 15)
  // good for 'fa'   21/12  10/10  25/23  15/30(very irregular), 20/40 , 20/60, 23/100
  int col0 = 13;
  int row0 = 21;
  //grid cell width
  float w0 = fontSize/col0;
  float h0 = fontSize/row0;
  
  for (int i = 0; i < pnts0.length/2; i++ ) 
  { 
    //draw the points
    //rect(pnts[i].x, pnts[i].y, 2, 2);
    //get the coordinates of the points
    float x = pnts0[i].x;
    float y = pnts0[i].y;
      
      //make new cells
       for ( int  p = 0; p < col0; p ++ ) {
         for ( int q = 0; q < row0; q ++ ) {
           Cell newcell = new Cell( p*w0 + offsetx, q*h0 + offsety, w0, h0);
           //for each point, check against the current cell
           if ( newcell.checkInside (x, y))  {
             newcell.render();
           }
         }
       }                   
  }
  
  for (int i = pnts0.length*5/6; i < pnts0.length; i++ ) 
  { 
    //draw the points
    //rect(pnts[i].x, pnts[i].y, 2, 2);
    //get the coordinates of the points
    float x = pnts0[i].x;
    float y = pnts0[i].y;
      
      //make new cells
       for ( int  p = 0; p < col0; p ++ ) {
         for ( int q = 0; q < row0; q ++ ) {
           Cell newcell = new Cell( p*w0 + offsetx, q*h0 + offsety, w0, h0);
           //for each point, check against the current cell
           if ( newcell.checkInside (x, y))  {
             newcell.render();
           }
         }
       }                   
  }
  popMatrix();
  
  
  endRecord();
 
}
