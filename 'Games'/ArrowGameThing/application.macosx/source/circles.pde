void setup_circles(){
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(5,40);
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    ySpeed[i] = random(0.3,1);
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
  }
}

void draw_circles(){
  for (int i=0; i<ballCount; i++){
    yPosition[i] += ySpeed[i];
    fill(colorR[i],colorG[i],colorB[i],100);
    noStroke();
    ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);

    if(yPosition[i] > height+20){
      xPosition[i] = random(width);
      yPosition[i] = -50;
      ballSize[i] = random(5,40);
      ySpeed[i] = random(0,1);
      colorR[i] = random(255);
      colorG[i] = random(255);
      colorB[i] = random(255);
    }
  }
}