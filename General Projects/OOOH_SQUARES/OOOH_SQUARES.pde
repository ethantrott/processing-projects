int x = -540;
int y = -540;

float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
 size(1280,800); 
 frameRate(80);
}

void draw(){
  x = mouseX-50;
  y = mouseY-50;
  stroke(r-50,g-50,b-50);
  strokeWeight(1);
  fill(r,g,b);
  rect(x,y,100,100);
}

void mousePressed(){
background(205);
  
x = -540;
y = -540;

r = random(255);
g = random(255);
b = random(255);
}
