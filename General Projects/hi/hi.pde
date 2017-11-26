void setup(){
  size(700,700);
}

void draw(){
  translate(320,350);
  background(random(255),random(255),random(255));
  textSize(random(40));
  textAlign(CENTER);
  text("HELLO",0,0);
  text("MATE", 30,50);
}