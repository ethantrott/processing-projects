int ballCount = 2999;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xSpeed = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

void setup(){
  /*fullScreen();
  surface.setResizable(true);*/
  size(500,500);
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(10,30);
    xPosition[i] = mouseX;
    yPosition[i] = mouseY;
    xSpeed[i] = random(-5,5);
    ySpeed[i] = random(-5,5);
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
  }
}

void draw(){
  background(#05043B);
  for (int i=0; i<ballCount; i++){
    xPosition[i] += xSpeed[i];
    yPosition[i] += ySpeed[i];
    fill(colorR[i],colorG[i],colorB[i],100);
    noStroke();
    rect(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);
    
    if (xPosition[i] < 0){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if (xPosition[i] > width){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(yPosition[i] < 0){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(yPosition[i] > height){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
  }
}

void keyPressed(){
  for (int i=0; i<ballCount; i++){
    xPosition[i] = mouseX;
    yPosition[i] = mouseY;
  }
}