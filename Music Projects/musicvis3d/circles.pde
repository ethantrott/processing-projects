ArrayList shapes;

boolean mouse = false;

float xoff = 0.0;
float yoff = 0.0;
float xincrement = 0; 
float yincrement = 0; 
float xoff1 = 0.0;
float yoff1 = 0.0;
float xincrement1 = 0; 
float yincrement1 = 0; 

void drawCircles(){
  beat.detect(song.mix);
  xoff += xincrement;
  yoff += yincrement;
  xoff1 += xincrement1;
  yoff1 += yincrement1;
  
  shapes.add(new Shape());
  if (two == true){
    shapes.add(new Shape());
  }
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0){
    shapes.remove(i);
    }
  }
}

class Shape{
  float sSize;
  float xPosition;
  float yPosition;
  float opacity;
  float r;
  float g;
  float b;
  float n = noise(xoff)*width;
  float n2 = noise(yoff)*height;
  float n1 = noise(xoff1)*width;
  float n21 = noise(yoff1)*height;
  
  Shape() {
      if (two == true){
        if (random(0,2) < 1){
        xPosition = n;
        yPosition = n2;
        }else{
        xPosition = n1;
        yPosition = n21;
        }
      }else{
        xPosition = n;
        yPosition = n2;
      }
    sSize = 30;
    opacity = 255;
    r = fillCircles;
    g = fillCircles;
    b = fillCircles;
}
  void run(){
    
    //sSize += 2;
    opacity -= 10;
    if ( beat.isOnset() ) eRadius = sSize+(random(0));
    noFill();
    strokeWeight(2);
    stroke(r,g,b,opacity);
    if ( eRadius < sSize ) eRadius = sSize;
    ellipse(xPosition, yPosition, eRadius, eRadius);
    eRadius *= 0.25;
  }
}