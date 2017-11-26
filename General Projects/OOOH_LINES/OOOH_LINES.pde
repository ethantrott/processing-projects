float x;
float y;
float x1;
float y1;

int h = 1;

float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
  size(1280,800);
}

void draw(){
  if (h > 0){
    x = mouseX-50;
    y = mouseY;
    x1 = mouseX+50;
    y1 = mouseY;
  }
  
  if (h < 0){
    x = mouseX;
    y = mouseY-50;
    x1 = mouseX;
    y1 = mouseY+50;
  }
  
  stroke(r,g,b);
  line(x,y,x1,y1);
}

void mousePressed(){
  h = h * -1;
  
  r = random(255);
  g = random(255);
  b = random(255);
  
  background(205);
}

void keyPressed(){
  r = random(255);
  g = random(255);
  b = random(255);
  
  background(205);
}
