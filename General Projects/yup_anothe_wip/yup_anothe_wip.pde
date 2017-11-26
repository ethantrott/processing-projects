float x = 0;

void setup(){
  fullScreen(P3D);
}

void draw(){
  background(205);
  x = x + 1;
  rotateY(radians(x));
  translate(width/2,0,0);
  rect(200,200,100,100);
}