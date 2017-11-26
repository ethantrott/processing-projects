int ballCount = 499;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xSpeed = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

void setup(){
  fullScreen();
  
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(10,120);
    xPosition[i] = width/2;
    yPosition[i] = height/2;
    xSpeed[i] = random(-15,15);
    ySpeed[i] = random(-10,10);
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
    ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);

    if (xPosition[i] < 0){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if (xPosition[i] > width){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if(yPosition[i] < 0){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if(yPosition[i] > height){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
  }
}

void keyPressed(){
  for (int i=0; i<ballCount; i++){
    xPosition[i] = width/2;
    yPosition[i] = height/2;
  }
}