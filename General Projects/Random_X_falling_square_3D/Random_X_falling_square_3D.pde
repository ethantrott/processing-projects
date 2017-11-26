int y = 0;
float x = 300;
float z = 300;

void setup(){
  size(650,650);
  frameRate(80);
}

void draw(){
  y = y + 1;
 float x = random(z - 10, z + 10);
 z = x + 0;
 
  if (y > height) {
    y = 0;
    x = 0;
    
    background(205);
  }
  
  if (x > width) {
    x = 300;
    z = 300;
  }
  
   if (x < 0) {
    x = 300;
    z = 300;
  }
  println(x);
  fill(255,255,255,155);
  rect(x-50,y-50,100,100);
}
