int y = 0;
void setup(){
  background(255);
  fullScreen();
  noCursor();
  frameRate(200);
}

void draw(){
 float x = random(1280);
 float z = random(100);
 float y = random(800);
 
 float g = random(20,105);
 float b = random(118,255);
  fill(0,g,b,155);
  strokeWeight(0.5);
  ellipse(x,y,z,z);
}

void keyPressed(){
  background(255);
}