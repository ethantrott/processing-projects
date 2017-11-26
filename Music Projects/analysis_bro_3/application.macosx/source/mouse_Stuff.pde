ArrayList shapes;
float w = 1;
int back = 0;
int t = 1;

void drawCircles(){
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  if (mousePressed){
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

  Shape() {
    xPosition = mouseX;
    yPosition = mouseY;
    sSize = 30;
    opacity = 255;
    r = 255;
    g = 255;
    b = 255;
  }
  
  void run(){
    
    sSize += 2;
    opacity -= 10;
    if ( beat.isOnset() ) eRadius = sSize+(random(50));
    noFill();
    strokeWeight(2);
    stroke(r,g,b,opacity);
if ( eRadius < sSize ) eRadius = sSize;
    if (w == 1){
    ellipse(xPosition, yPosition, eRadius, eRadius);
    }else if (w == -1){
    rect(xPosition-(sSize/2), yPosition-(sSize/2), eRadius, eRadius);
    }
    eRadius *= 0.25;
  }
}