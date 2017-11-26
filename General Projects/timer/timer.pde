int min = 10;
int max = 90;

float time = random(min*60,max*60);
float iTime;
float fix;
String word;
String wWord;
int first = 0;
int chance = int(random(0,2));
float weird = int(random(0,3));

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
  fullScreen();
  //size(400,400);
  surface.setResizable(true);
  noCursor();
  minim = new Minim(this);
  player = minim.loadFile("music.mp3");
  iTime = time;
  println(iTime);
  
  if (weird == 1){
    wWord="small";
  }else if (weird == 2){
    wWord="medium";
  }else if (weird == 3){
    wWord="high";
  }
  player.loop();
}

void draw(){
  time -= 1;
  if (time < 1){
    if (first == 0){
      fix = frameRate;
      player.pause();
      first +=1;
    }
    background(random(255),random(255),random(255));
    textSize(54);
    text("I said this was a " + word + " length timer.",10,60);
    text("Done. The timer was set to about " + int(iTime/fix) + " seconds.", 10, height - 10);
  }else{
    background(0,255,0);
    textSize(54);
    if(chance == 1){
      if (iTime <= ((max-min)*0.33*60)){
          word = "small";
      }else if(iTime > ((max-min)*0.33*60)){
        if (iTime <= ((max-min)*0.66*60)){
          word = "medium";
        }
        if (iTime > ((max-min)*0.66*60)){
          word = "high";
        }
      }
    }else if (chance == 2) {
      word=wWord;
    }
    textSize(54);
    text("This may be a " + word + " length timer.",10,60);
  }
}

void keyPressed(){
  player.loop();
  time = random(min*60,max*60);
  iTime = time;
  first = 0;
  chance = int(random(0,3));
  weird = int(random(0,4));
  if (weird == 1){
    wWord="small";
  }else if (weird == 2){
    wWord="medium";
  }else if (weird == 3){
    wWord="high";
  }
}