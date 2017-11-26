float mx = mouseX;
float my = mouseY;
float z = 1;
float rx = random(width);
float ry = random(height);

void setup(){
  fullScreen();
}

void draw(){
  background(0);
  if (z==1){
    mx = mouseX;
    my = mouseY;
  }
  fill(255,0,0);
  ellipse(rx,ry,50,50);
  ellipse(mx,my,50,50);
  
  if (mx - rx<=50){
    if (my - ry<=50){
      background(255);
    }
    if (ry - my<=50){
      background(255);
    }
  }
  if (rx - mx<=50){
    if (my - ry<=50){
      background(255);
    }
    if (ry - my<=50){
      background(255);
    }
  }
}

void mousePressed(){
  z = z*-1;
  mx = mouseX;
  my = mouseY;
}

void keyPressed(){
  rx = random(width);
  ry = random(height);
}