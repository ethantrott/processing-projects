float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
  size(1280,800);
  frameRate(30);
}

void draw(){
  background(0);
  fill(r,g,b);
  ellipse(width/2, height/2, 400,400);
  noStroke();
  fill(255,255,255,255);
  rect(0,0,120,55);
  fill(r,0,0);
  text("r = "+ r, 10, 10);
  fill(0,g,0);
  text("g = "+ g, 10, 30);
  fill(0,0,b);
  text("b = "+ b, 10, 50);
}

void keyPressed(){
 r = random(255);
 g = random(255);
 b = random(255);
}
