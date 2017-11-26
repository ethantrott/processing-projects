int x=1;

void keyPressed(){
  if (key=='s'||key=='S'){
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:","fileSelected");
    float a = random(200);
    float b = random(100);
    float c = random(200);

  }else if(key == '`'||key == '~'){
    w = w * -1;
  }
  else{
  song.pause();
  if(x < 0){
    song.play();
  }
  x = x * -1;
  }
}