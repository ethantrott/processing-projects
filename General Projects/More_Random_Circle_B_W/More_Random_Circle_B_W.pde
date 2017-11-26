float x = random(1280);
float y = random(800);

float r = random(255);

float s = random(40,200);


void setup(){
  fullScreen();
}

void draw(){
  stroke(r+50);
  strokeWeight(4);
  fill(r,r,r,25);
  ellipse(x,y,s,s);
}

void keyPressed(){
  x = random(width);
  y = random(height);
  
  r = random(255);
  
  s = random(40,120);
}

void mousePressed(){
  background(205);
}