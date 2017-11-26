PImage steve;
PImage creep;
PImage grass;
PImage mario;

float x = 0;
float x1 = 0;
float g;
float y;
float y1;
float b;
float s = 4;

void setup(){
  size(700,400);
  frameRate(20);
  y = (height/3)*2;
  b = width;
  mario = loadImage("mario.png");
  steve = loadImage("steve.png");
  creep = loadImage("creep.png");
  grass = loadImage("grass.jpg");
}

void draw(){
  background(#30D4F0);
  
  fill(255);
  stroke(0);
  
  b=b-s;
  if(b<-10){
    b=width;
    s=s+0.5;
  }
  
  g=height/3*2;
  
  image(creep,b,g,40,-40);
  image(steve,x,y,85,-100);
  image(mario,x1,y1,65,-70);
  
  if(y < g){
    delay(10);
    y=g;
  }
  if(y1 < g){
    delay(10);
    y1=g;
  }
  
  if (keyPressed){
    if (key == 'd' || key == 'D'){
       x=x+4;
    }
    if (key == 'a' || key == 'A'){
      x=x-4;
    }
    if (key == ' '){
      y=y-60;
    }
  }
  
  if (keyPressed){
    if (key == 'w' || key == 'W'){
       x1=x1+4;
    }
    if (key == 'q' || key == 'Q'){
      x1=x1-4;
    }
    if (key == 'k' || key == 'K'){
      y1=y1-60;
    }
  }
  
  image(grass,0,height,width,-height/3);
}