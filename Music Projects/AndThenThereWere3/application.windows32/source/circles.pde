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
float xoff2 = 0.0;
float yoff2 = 0.0;
float xincrement2 = 0; 
float yincrement2 = 0; 
int pastXL;
int pastYL;
int pastXR;
int pastYR;
int pastX;
int pastY;

void drawCircles() {
  xoff += xincrement;
  yoff += yincrement;
  xoff1 += xincrement1;
  yoff1 += yincrement1;
  xoff2 += xincrement2;
  yoff2 += yincrement2;
  shapes.add(new Shape());
  if (three == true) {
    shapes.add(new Shape());
    shapes.add(new Shape());
  }
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0) {
      shapes.remove(i);
    }
  }
}

class Shape {
  float sSize;
  float xPosition;
  float yPosition;
  float opacity;
  float n = noise(xoff)*width;
  float n2 = noise(yoff)*height;
  float nL = noise(xoff1)*width;
  float n2L = noise(yoff1)*height;
  float nR = noise(xoff2)*width;
  float n2R = noise(yoff2)*height;
  float r;
  float g;
  float b;

  Shape() {
    if (three == true) {
      if (rand == 1) {
        xPosition = nL;
        yPosition = n2L;
        r = 95;
        g=0;
        b=0;
      } else if (rand == 2) {
        xPosition = nR;
        yPosition = n2R;
        r=0;
        g=0;
        b=95;
      } else {
        xPosition = n;
        yPosition = n2;
        r=0;
        g=95;
        b=0;
      }
    } else {
      xPosition = n;
      yPosition = n2;
      r = 0;
      g = 95;
      b = 0;
    }
    sSize = 30;
    opacity = 255;
  }
  void run() {
    opacity -= disRate;
    noFill();
    strokeWeight(2);
    stroke(r, g, b, opacity);
    fill(r-40,g-40,b-40,opacity-50);
    ellipse(xPosition, yPosition, 30, 30);
    strokeWeight(2);
    if (three == true) {
      if (r==95) {
        line(xPosition, yPosition, pastXL, pastYL);
        pastXL = int(xPosition);
        pastYL = int(yPosition);
      }
      if (b==95) {
        line(xPosition, yPosition, pastXR, pastYR);
        pastXR = int(xPosition);
        pastYR = int(yPosition);
      }
    }
    if (g==95) {
      line(xPosition, yPosition, pastX, pastY);
      pastX = int(xPosition);
      pastY = int(yPosition);
    }
  }
}