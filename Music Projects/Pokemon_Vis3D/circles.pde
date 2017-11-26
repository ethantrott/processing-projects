ArrayList shapes;
ArrayList shapes1;

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
    shapes1.add(new Shape1());
  }
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0){
    shapes.remove(i);
    }
  }
  for (int i=0; i<shapes1.size(); i++) {
    Shape1 s = (Shape1) shapes1.get(i);
    s.run();
    if (s.opacity < 0){
    shapes1.remove(i);
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
  PImage bodyn;
  Shape() {
        xPosition = n;
        yPosition = n2;

    sSize = 30;
    opacity = 255;
    r = fillCircles;
    g = fillCircles;
    b = fillCircles;
}
  void run(){
    
    //sSize += 2;
    opacity -= 8;
    if ( beat.isOnset() ) eRadius = sSize+(random(0));
    noFill();
    strokeWeight(2);
    tint(255,255,255,opacity);
    if ( eRadius < sSize ) eRadius = sSize;
    pushMatrix();
    translate(0,0,200);
    image(body, xPosition, yPosition, 10,24);
    popMatrix();
    eRadius *= 0.25;
  }
}

class Shape1{
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
  PImage bodyn;
  Shape1() {
        xPosition = n1;
        yPosition = n21;
    sSize = 30;
    opacity = 255;
    r = fillCircles;
    g = fillCircles;
    b = fillCircles;
}
  void run(){
    
    //sSize += 2;
    opacity -= 8;
    if ( beat.isOnset() ) eRadius = sSize+(random(0));
    noFill();
    strokeWeight(2);
    tint(255,255,255,opacity);
    if ( eRadius < sSize ) eRadius = sSize;
    pushMatrix();
    translate(0,0,200);
    image(bodyg, xPosition, yPosition, 10,24);
    popMatrix();
    eRadius *= 0.25;
  }
}