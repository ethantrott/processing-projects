import processing.sound.*;
SoundFile file;
int x=1;
int h=1;
int a1=0;
int a2=255;

void setup()
{
  size(700, 700, P3D);
  frameRate(90);
  file = new SoundFile(this, "/Users/Ethan/Music/fight.mp3");
  file.play();
}

  
void draw()
{
  background(a1);
  
for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    stroke(a2);
    line(x1, height/7 + player.mix.get(i)*50, x2, height/7 + player.mix.get(i+1)*50);
    noStroke();
    fill(#3652FF);
    ellipse((width/2-(width/3)),(height/2)-70,60,60);
    ellipse((width/2+(width/3)),(height/2)-70,60,60);
    fill(#F23636);
    ellipse(width/2,(height/2)+100, 300, player.mix.get(i)*150);
  }
}
void keyPressed(){
  player.pause();
  
  if(x < 0){
    player.play();
  }
    x = x * -1;
}

void mousePressed(){
  if(h > 0){
    a1=255;
    a2=0;
  }
  if(h < 0){
    a1=0;
    a2=255;
  }
  h=h*-1;
}