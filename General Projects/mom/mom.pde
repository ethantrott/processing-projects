
PFont mom;

int ballCount = 601;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xPosition2 = new float[ballCount];
float [] yPosition2 = new float[ballCount];
float [] ySpeed = new float[ballCount];

void setup(){
  mom = loadFont("mom.vlw");
  fullScreen();
  mouseY = height-1;
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(1,5);
    xPosition[i] = mouseX;
    yPosition[i] = mouseY;
    xPosition2[i] = random(width);
    yPosition2[i] = 0;
    ySpeed[i] = random(6,12);
  }
}

void draw(){
  background(#D00DDB);
  textFont(mom);
  text("Happy Birthday!", 10,50);
  for (int i=0; i<ballCount; i++){
    yPosition[i] += ySpeed[i];
    yPosition2[i] += ySpeed[i];
    
    noStroke();
    fill(random(255)+40,random(255)+40,random(255)+40);
    rect(xPosition[i],yPosition[i],ballSize[i]+5,ballSize[i]+15);
    fill(255);
    ellipse(xPosition2[i],yPosition2[i],ballSize[i],ballSize[i]);


      if(yPosition[i] < 0){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    if(yPosition[i] > height){
      xPosition[i] = mouseX;
      yPosition[i] = mouseY;
    }
    
    
    if(yPosition2[i] < 0){
      xPosition2[i] = random(width);
      yPosition2[i] = 0;
    }
    if(yPosition2[i] > height){
      xPosition2[i] = random(width);
      yPosition2[i] = 0;
    }
   
    }
  }