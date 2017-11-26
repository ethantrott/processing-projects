float h = 255;
float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
  noCursor();
  fullScreen();
  frameRate(80);
  background(255);
}

void draw(){
  background(r,g,b);
  r = r - 5;
  g = g - 5;
  b = b - 5;
}

void keyPressed(){
  r = random(255);
  g = random(255);
  b = random(255);
}