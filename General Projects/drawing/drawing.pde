int z = 255;

void setup(){
  size(650,650);
  frameRate(2000);
  background(255);
}

void draw(){
  
  noStroke();
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX,mouseY,1,1);
  
}


