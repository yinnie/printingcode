void setup()
{  
  size(1280, 800);
  smooth();
  background(255);
  translate(width / 2, height / 2);
  
  int circleRadius = 500;
  float numVertices = 600;
  float vertexDegree = 360 / numVertices;
  
  fill(30);
  noStroke();
  
  beginShape();
  for(int i = 0; i < numVertices + 3; i++)
  {
    float x = cos(radians(i * vertexDegree)) * (circleRadius + random(30));
    float y = sin(radians(i * vertexDegree)) * (circleRadius + random(30));
    vertex(x, y);
  }
  endShape();
}
