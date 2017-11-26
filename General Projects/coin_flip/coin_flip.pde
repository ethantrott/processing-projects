String nameH = "Ethan";
String nameT = "Anna";
int amount = 10001;

float p = random(0,2);
int m = 0;
int h = 0;
int t = 0;
boolean running = false;

void setup(){
  fullScreen();
  surface.setResizable(true);
  frameRate(500);
  noCursor();
}
void draw(){
  background(0);
  textSize(22);
  textAlign(LEFT,TOP);
  fill(0,255,0);
  text(nameH + " : "+ h,10,10);
  fill(255,0,0);
  text(nameT + " : "+ t,10,48);
  fill(255);
  text("Total : "+ m,10,86);
  
  if (h>t){
      heads();
    }else{
      tails();
    }
    
  if (running == true){
    if (m < amount){
      flip();
    }else{
      running = false;
    }
  }
}

void mousePressed(){
  if (running == false){
  h = 0;
  t = 0;
  m = 0;
  running = true;
  }
}