//exercise on generative typography. 
//experiment to convert the character into 

import geomerative.*;

RShape grp;

void setup(){

  size(600,400);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);

  background(255);
  fill(0);
  stroke(0);
  
  //load font from data folder, size, alignment
  grp = RG.getText("道法", "wt006.ttf", 120, CENTER);
}

void draw(){
  
  background(255);
   
  translate(width/2, height/2);
  
  // Draw the string "Hola mundo!" on the PGraphics canvas g (which is the default canvas of the sketch)  
  grp.draw();
  
  
}
