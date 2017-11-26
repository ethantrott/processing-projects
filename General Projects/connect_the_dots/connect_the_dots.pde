float x = -800;
float y = -800;

float x1 = -800;
float y1 = -800;

void setup(){
  size(700,700);
}

void draw(){
  ellipse(x,y,50,50);
  line(x1,y1,x,y);
}

void mousePressed(){
  x1 = x;
  x = mouseX;
  y1 = y;
  y = mouseY;
}

void keyPressed(){
  background(205);
}
