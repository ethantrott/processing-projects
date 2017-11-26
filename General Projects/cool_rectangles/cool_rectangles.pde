float q = random(width);
float w = random(height);

float r = 0;
float g = 0;
float b = 255;

void setup(){
  fullScreen();
  background(0);
}

void draw(){
  stroke(r,g,b);
  strokeWeight(3);
  fill(r+30,g+30,b+30,5);
  rect(mouseX, mouseY, (q-mouseX), (w-mouseY));
}

void mousePressed(){
  q=mouseX;
  w=mouseY;
  background(0);
}

void keyPressed(){
  if (key=='r'||key=='R'){
    q = random(width);
    w = random(height);
    background(0);
  }else if(key=='c'||key=='C'){
    r = random(255);
    g = random(255);
    b = random(255);
  }else
   background(0);
}