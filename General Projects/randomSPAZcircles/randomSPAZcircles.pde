float x = random(width);
float y = random(height);
float z = 0;
void setup(){
  fullScreen(
  P3D);
}

void draw(){
  background(205);
  z = z + 2;
  x = x+random(-1,1);
  y = y+random(-1,1);
  
  if (x < 0 || x > width){
    x = random(width);
    y = random(height);
  }
  if (y < 0 || x > height){
    x = random(width);
    y = random(height);
  }
  
  pushMatrix();
  translate(x,y,0);
  fill(random(255),random(255),random(255));
  rotateY(z);
  stroke(random(255),random(255),random(255));
  sphere(123);
  popMatrix();
}

void keyPressed(){
  x = random(width);
  y = random(height);
}