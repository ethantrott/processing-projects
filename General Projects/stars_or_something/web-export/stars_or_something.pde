int ballCount = 49;
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] noiseX = new float[ballCount];
float [] noiseY = new float[ballCount];
float [] random = new float[ballCount];
void setup() {
  //fullScreen();
  size(screen.width,screen.height);
  for (int i=0; i<ballCount; i++) {
    xPosition[i] = width/2;
    yPosition[i] = height/2;
    noiseX[i] = random(-15, 15);
    noiseY[i] = random(-10, 10);
    random[i] = random(1, 3);
  }
}

void draw() {
  background(0);
  for (int i=0; i<ballCount; i++) {
    xPosition[i]= xPosition[i] + noiseX[i];
    yPosition[i]= yPosition[i] + noiseY[i];
    noStroke();
    ellipse(xPosition[i], yPosition[i], 10, 10);

    if (xPosition[i]>width+10) {
      xPosition[i] = width/2;
      yPosition[i] = height/2;
      noiseX[i] = random(-2, 2);
      noiseY[i] = random(-2, 2);
    }
    if (xPosition[i]<-10) {
      xPosition[i] = width/2;
      yPosition[i] = height/2;
      noiseX[i] = random(-2, 2);
      noiseY[i] = random(-2, 2);
    }
    if (yPosition[i]>width+10) {
      xPosition[i] = width/2;
      yPosition[i] = height/2;
      noiseX[i] = random(-2, 2);
      noiseY[i] = random(-2, 2);
    }
    if (yPosition[i]<-10) {
      xPosition[i] = width/2;
      yPosition[i] = height/2;
      noiseX[i] = random(-2, 2);
      noiseY[i] = random(-2, 2);
    }
  }
}

void mousePressed() {
  for (int i=0; i<ballCount; i++) {
    xPosition[i] = mouseX;
    yPosition[i] = mouseY;
    noiseX[i] = random(-10, 10);
    noiseY[i] = random(-10, 10);
  }
}

