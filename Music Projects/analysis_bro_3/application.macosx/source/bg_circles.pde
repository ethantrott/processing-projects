int ballCount = 499;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xSpeed = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

void setup_circles(){
  for (int q=0; q<ballCount; q++){
    ballSize[q] = random(10,40);
    xPosition[q] = random(width);
    yPosition[q] = random(height);
    xSpeed[q] = random(-25,25);
    ySpeed[q] = random(-15,15);
    colorR[q] = random(255);
    colorG[q] = random(255);
    colorB[q] = random(255);
  }
}

void draw_circles(){
  for (int q=0; q<ballCount; q++){
    xPosition[q] += xSpeed[q];
    yPosition[q] += ySpeed[q];
    fill(colorR[q],colorG[q],colorB[q],40);
    noStroke();
   if (shape == 1){
    ellipse(xPosition[q],yPosition[q],ballSize[q],ballSize[q]);
   }
   if (shape == 2){
    rect(xPosition[q],yPosition[q],ballSize[q],ballSize[q]);
   }
    if (xPosition[q] < 0){
      xPosition[q] = random(width);;
      yPosition[q] = random(height);
    }
    if (xPosition[q] > width){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
    if(yPosition[q] < 0){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
    if(yPosition[q] > height){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
  }
}