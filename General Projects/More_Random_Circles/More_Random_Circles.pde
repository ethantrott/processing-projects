float x = random(1280);
float y = random(800);

float r = random(255);
float g = random(255);
float b = random(255);

float s = random(40,200);

int n = 0;


void setup(){
  size(700,700);
  frameRate(80);
}

void draw(){
  stroke(r+50,g+50,b+50);
  strokeWeight(4);
  fill(r,g,b,25);
  ellipse(x,y,s,s);
  fill(255);
  noStroke();
  rect(0,0,50,20);
  fill(0);
  text(n,10,15);
}

void keyPressed(){
  x = random(width);
  y = random(height);
  
  r = random(255);
  g = random(255);
  b = random(255);
  
  s = random(40,120);
  
  n = n + 1;
}

void mousePressed(){
  background(204);
  n = 0;
}
