int ballCount = 501;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] ySpeed = new float[ballCount];

void setup(){
  size(500,500);
  noCursor();
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(1,5);
    xPosition[i] = mouseX;
    yPosition[i] = mouseY;
    ySpeed[i] = random(6,12);
  }
}

void draw(){
  background(#05043B);
  
  for (int i=0; i<ballCount; i++){
    yPosition[i] += ySpeed[i];
    noStroke();
    ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);
    
    if(yPosition[i] < 0){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(yPosition[i] > height){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(xPosition[i] < 0){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(xPosition[i] > width){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
  }
}