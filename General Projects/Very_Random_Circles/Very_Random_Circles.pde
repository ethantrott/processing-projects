int y = 0;
int n = 0;
void setup(){
  background(255);
  fullScreen();
  frameRate(200);
}

void draw(){
 float x = random(1280);
 float z = random(100);
 float a = random(255);
 float b = random(255);
 float c = random(255);
 float y = random(800);
 n = n + 1;

 fill(a,b,c,155);
 strokeWeight(0.5);
 ellipse(x,y,z,z);
 fill(255);
 noStroke();
 rect(0,0,50,20);
 fill(0);
 text(n,10,15);
 
}