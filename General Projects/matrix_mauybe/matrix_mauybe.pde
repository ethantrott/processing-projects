int modif = int(random(-6, 10));
ArrayList lines;

void setup() {
  fullScreen();
  noCursor();
  lines=new ArrayList();
}
void draw() {
  background(0);
  if (lines.size() < 1){
    for  (int i=0; i<(height/30)+1; i++){
      lines.add(new Line());
    }
  }
  noStroke();
  fill(modif*10+50, modif*18+50, modif*4+50);
  if (modif!=0) {
    for (int i=0; i<90*modif; i++) {
      rect(abs(random(width)), abs(random(height)), random(6*modif), random(6*modif));
    }
  }
  fill(110,150,74);
  for (int i=0; i<lines.size(); i++) {
    Line s = (Line) lines.get(i);
    s.textY= i*30;
    s.run();
    if (s.text.length() < 1){
      lines.remove(i);
      lines.add(new Line());
    }
  }
  modif = int(random(-6, 6));
}

class Line{
  int textX;
  int textY;
  String text="";
  int speed;
  
  Line() {
    speed = int(random(9,12));
    textX=int(random(-width,0));
    textY=0;
    for (int i = 0; i<400; i++){
      text+=int(random(2));
    }
  }
  
  void run(){
     textX-=speed;
     textSize(24);
     text(text,textX,textY);
     if (textX < -2000){
       text="";
     }
  }
}