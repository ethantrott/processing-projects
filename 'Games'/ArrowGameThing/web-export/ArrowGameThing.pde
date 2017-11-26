/*
*                    Arrow Game Thing
*                 Made by Ethan Trott
*
*      A game thing with arrows and arrays!
*/

//TO PLAY: Click Run to start, and then, move with A and D, jump with SPACEBAR, shoot Arrow with Left Click.//

void setup(){
    size(700,400);
    setup_stuff();
}

void draw(){
  background(#412b41);
  pushMatrix();
  if (zOpacity == 0){
   score = score + 1;
 }
  draw_circles();
  hearts();
  fill(33,40,51,232);
  noStroke();
  rect(0,height,width,-height/5);
  zombie_stuff();
  archer_stuff();
  jump_check();
  check_movement();
  textFont(font);
  stroke(255);
  fill(255);
  if (score > 9){
    scoreX = width - 52;
  }
  if (score > 99){
    scoreX = width - 78;
  }
  if (score > 999){
    score = 999;
  }
  popMatrix();
  text(score,scoreX,height-10);
}

void keyPressed(){
  if (abs(ax-zx)<5){
    zOpacity = 0;
  }
}
void archer_stuff(){
  if(scale == -1){
    if (pax == 7){
      tint(255,oA);
      image(arrow,ax,ay,93,32);
    }
    if (pax == 6){
      pushMatrix();
      scale(-1,1);
      tint(255,255);
      image(arrow,-ax-93,ay,93,32);
      popMatrix();
    }
    scale(-1,1);
    tint(255,o1);
    image(a1,-x-101,b,101,-122);
    tint(255,o2);
    image(a2,-x-110,b,110,-170);
    tint(255,o3);
    image(a3,-x-90,b,90,-176);
    tint(255,o4);
    image(a4,-x-102,b,102,-127);
    tint(255,o5);
    image(a5,-x-116,b,116,-189);
    
    scale(1,1);
    
    if (pax == 6){
      ax = ax - aSpeed;
      if (abs(ax-zx)<10){
    zOpacity = 0;
  }
    }
    if (pax == 7){
      ax = ax + aSpeed;
      if (abs(ax-zx)<10){
    zOpacity = 0;
  }
    }
    if (pax == 1){
      ax = ax - aSpeed;
      if (abs(ax-zx)<10){
    zOpacity = 0;
  }
      pax = 6; //6 means left
    }
  }
  else {
    if (pax == 7){
      tint(255,oA);
      image(arrow,ax,ay,93,32);
    }
    if (pax == 6){
      pushMatrix();
      scale(-1,1);
      tint(255,255);
      image(arrow,-ax-93,ay,93,32);
      popMatrix();
    }
    pushMatrix();
    tint(255,o1);
    image(a1,x,b,101,-122);
    tint(255,o2);
    image(a2,x,b,110,-170);
    tint(255,o3);
    image(a3,x,b,90,-176);
    tint(255,o4);
    image(a4,x,b,102,-127);
    tint(255,o5);
    image(a5,x,b,116,-189);
    popMatrix();
    if (pax == 6){
      ax = ax - aSpeed;
      if (abs(ax-zx)<10){
    zOpacity = 0;
  }
    }
    if (pax == 7){
      ax = ax + aSpeed;
      if (abs(ax-zx)<10d){
    zOpacity = 0;
  }
    }
    if (pax == 1){
      pax = 7; //7 means right
    }
  }
  
   if (ax > width){
      ax = random(5000,10000);
      pax = 1;
      oA=255;
    }
   if (ax < -93){
      ax = random(5000,10000);
      pax = 1;
      oA=255;
    }
}
void setup_circles(){
  for (int i=0; i<ballCount; i++){
    ballSize[i] = random(5,40);
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    ySpeed[i] = random(0.3,1);
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
  }
}

void draw_circles(){
  for (int i=0; i<ballCount; i++){
    yPosition[i] += ySpeed[i];
    fill(colorR[i],colorG[i],colorB[i],100);
    noStroke();
    ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);

    if(yPosition[i] > height+20){
      xPosition[i] = random(width);
      yPosition[i] = -50;
      ballSize[i] = random(5,40);
      ySpeed[i] = random(0,1);
      colorR[i] = random(255);
      colorG[i] = random(255);
      colorB[i] = random(255);
    }
  }
}
void hearts(){
  tint(255,255);
  if (life < 1){
  exit();
  }
  if (life > 0){
  image(heart, 0,0,30,30);
  }
  if (life > 1){
  image(heart, 32,0,30,30);
  }
  if (life > 2){
  image(heart, 64,0,30,30);
  }
}
void check_movement(){
  if (keyPressed){
    if (key == 'd' || key == 'D'){
       x=x+4;
       scale = 1;
    }
    if (key == 'a' || key == 'A'){
      x=x-4;
      scale = -1;
    }
    if (key == 'q' || key == 'Q'){
      zOpacity = 0;
    }
    
    if (key == 'w' || key == 'W'){
      zOpacity = 255;
    }
    if (key == ' '){
      b=b-42;
    }
  }
}

void jump_check(){
  if(b < (height/5)*4){
    delay(10);
    b=(height/5)*4;
  }
}

void mousePressed(){
  if (pax == 1){
    o2 = 0;
    o3 = 255;
    
    ax = x;
    ay = b-150;
  }
}

void mouseReleased(){
  o2 = 255;
  o3 = 0;
  o4 = 0;
  o5 = 0;
}
import processing.sound.*;
SoundFile music;

int ballCount = 499;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

float ax = 1000;
float ay;
float zx = 700;

int o1 = 0;
int o2 = 255;
int o3 = 0;
int o4 = 0;
int o5 = 0;
int oA = 255;

PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
PImage arrow;
PImage z;
PImage heart;
PFont font;

float b;
float x;
float y;
int scale = 1;
int aSpeed = 15;

float pax = 1;
float zax = 1;

float zOpacity = 255;
float zSpeed = 1;
float pzSpeed = 1;

float life = 3;
int score = 0;
int scoreX = 700 - 26;

void setup_stuff(){
  noCursor();
  font = loadFont("font.vlw");
  music = new SoundFile(this, "song.mp3");
  music.loop();
  
  b = (height/5)*4;
  
  a1 = loadImage("1.png");
  a2 = loadImage("2.png");
  a3 = loadImage("3.png");
  a4 = loadImage("4.png");
  a5 = loadImage("5.png");
  arrow = loadImage("arrow.png");
  z = loadImage("z.png");
  heart = loadImage("life.png");
  setup_circles();
}
void zombie_stuff(){
  zx = zx - zSpeed;
  
  if (abs(x-zx)<5){
    life = life -1;
    zx = 700;
    zOpacity = 255;
  }
  tint(255, zOpacity);
  image(z,zx,b,88,-170);
  
  if (zx < -88){
    zx = 750;
  }
  
  if (zOpacity == 0){
    ax = random(5000,10000);
    
    if (zSpeed < 4){
      zSpeed = zSpeed + 0.25;
    }
    
    oA = 0;
    zx = 700;
    zOpacity = 255;
  }
}