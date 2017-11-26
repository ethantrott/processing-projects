float a = random(width);
float b = random(height);
float a1 = random(width);
float b1 = random(height);

float r = random(255);
float g = random(255);
float b2 = random(255);

void setup(){
  size(700,700);
  frameRate(5);
}

void draw(){
  r = random(255);
  g = random(255);
  b2 = random(255);
  
  fill(r,g,b2,150);
  
  a1 = a;
  b1 = b;
  a = random(width);
  b = random(height);
  
  ellipse(a,b,50,50);
  line(a,b,a1,b1);
}

void keyPressed(){
  background(205);
}
