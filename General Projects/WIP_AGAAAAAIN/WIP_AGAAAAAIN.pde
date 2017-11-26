float q = 20;
float c = random(20,50);
float s = (c-20)/20;
void setup(){
  //fullScreen();
  size(300,300);
  println("C = " + c);
  println("S = " + s);
}

void draw(){
  background(205);
  if (q>c){
    c = random(20,50);
    s = (c - 20)/20;
    println("C = " + c);
    println("S = " + s);
  }
  q = q + s;
  ellipse(displayWidth/2, displayHeight/2, q, q);
}