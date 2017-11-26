int size = 10;

void setup(){
  fullScreen();
  noCursor();
}

void draw(){
  background(255);
  size+=1;
  fill(0);
  textSize(size);
  textAlign(CENTER, CENTER);
  text(size,mouseX,mouseY);
}