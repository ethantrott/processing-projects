float x;
float y;
float z;
float h;

float a = random(800);
float b = random(800);
void setup(){
  size(800,800);
  frameRate(60);
}

void draw(){
  background(205);
  
  x = mouseY;
  y = mouseX;
  z = width/2;
  h = height/2;
  
  stroke(random(255),random(255),random(255));
  strokeWeight(1);
  line(x,y,z,h);
  
  stroke(0);
  ellipse(a,b,100,100);
}
