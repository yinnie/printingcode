void setup()
{
  size(1280, 800);
  colorMode(HSB, 360, 100, 100);
  background(360);
  
  // first pick base color
  HSBColor color1 = new HSBColor(0, 100, 100);
  
  // then find colors on each side of this color by adding/subtracting
  // a specific number of degrees on the hue scale.
  int leftHue = (color1.h + 240) % 360;
  int rightHue = (color1.h + 120) % 360;
  
  HSBColor color2 = new HSBColor(leftHue, 100, 100);
  HSBColor color3 = new HSBColor(rightHue, 100, 100);
  
  // then we draw them on the screen
  int rectSize = 400;
  translate(40, 200);
  color1.display(0, 0, rectSize, rectSize);
  color2.display(rectSize*2, 0, rectSize, rectSize);
  color3.display(rectSize, 0, rectSize, rectSize);
}
