float x = random(1280);
float y = random(800);
float x1 = random(1280);
float y1 = random(800);
float x2 = random(1280);
float y2 = random(800);
float x3 = random(1280);
float y3 = random(800);
float x4 = random(1280);
float y4 = random(800);
float x5 = random(1280);
float y5 = random(800);
float x6 = random(1280);
float y6 = random(800);
float x7 = random(1280);
float y7 = random(800);
float x8 = random(1280);
float y8 = random(800);
float x9 = random(1280);
float y9 = random(800);
float x0 = random(1280);
float y0 = random(800);
float x11 = random(1280);
float y11 = random(800);
float x12 = random(1280);
float y12 = random(800);
float x13 = random(1280);
float y13 = random(800);
float x14 = random(1280);
float y14 = random(800);
float x15 = random(1280);
float y15 = random(800);

float ax;
float ay;

void setup(){
  fullScreen();
}

void draw(){
  noStroke();
  fill(0);
  ellipse(x,y,10,10);
  ellipse(x1,y1,10,10);
  ellipse(x2,y2,10,10);
  ellipse(x3,y3,10,10);
  ellipse(x4,y4,10,10);
  ellipse(x5,y5,10,10);
  ellipse(x6,y6,10,10);
  ellipse(x7,y7,10,10);
  ellipse(x8,y8,10,10);
  ellipse(x9,y9,10,10);
  ellipse(x0,y0,10,10);
  ellipse(x11,y11,10,10);
  ellipse(x12,y12,10,10);
  ellipse(x13,y13,10,10);
  ellipse(x14,y14,10,10);
  ellipse(x15,y15,10,10);
  
  ax = (x+x1+x2+x3+x4+x5+x6+x7+x8+x9+x0+x11+x12+x13+x14+x15)/15;
  ay = (y+y1+y2+y3+y4+y5+y6+y7+y8+y9+y0+y11+y12+y13+y14+y15)/15;
  
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  ellipse(ax,ay,50,50);
  fill(255);
  noStroke();
  ellipse(ax,ay,5,5);
  
  text("The Random Average Point Is "+ ax +", "+ ay,0,10);
  text("The Actual Average Point is 640, 400",0,50);
}

void keyPressed(){
  background(205);
    x = random(1280);
  y = random(800);
  x1 = random(1280);
  y1 = random(800);
  x2 = random(1280);
  y2 = random(800);
  x3 = random(1280);
  y3 = random(800);
  x4 = random(1280);
  y4 = random(800);
  x5 = random(1280);
  y5 = random(800);
  x6 = random(1280);
  y6 = random(800);
  x7 = random(1280);
  y7 = random(800);
  x8 = random(1280);
  y8 = random(800);
  x9 = random(1280);
  y9 = random(800);
  x0 = random(1280);
  y0 = random(800);
  x11 = random(1280);
  y11 = random(800);
  x12 = random(1280);
  y12 = random(800);
  x13 = random(1280);
  y13 = random(800);
  x14 = random(1280);
  y14 = random(800);
  x15 = random(1280);
  y15 = random(800);
}