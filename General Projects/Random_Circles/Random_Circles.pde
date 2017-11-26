int y = 0;
void setup(){
  background(255);
  size(1280, 800);
  frameRate(200);
}

void draw(){
 float x = random(1280);
 float z = random(100);
 float a = random(255);
 float b = random(255);
 float c = random(255);
 
 y = y + 1; 
 
 if (y > height) {
  y = 0;
 }
 
 fill(a,b,c);
 strokeWeight(0.5);
 ellipse(x,y,z,z);
 
}
