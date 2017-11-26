boolean paused = false;
void keyPressed(){
  if (key=='s'||key=='S'){
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:","fileSelected");
  }else if (key == 'g'){
    if (two == false){
      two = true;
    }else{
      two = false;
    }
  }else if (key == ' '){
    if (paused == false){
      song.pause();
      xincrement = 0; 
      yincrement = 0; 
      xincrement1 = 0; 
      yincrement1 = 0; 
      paused = true;
    }else{
      song.play();
      paused = false;
    }
  }/*BETA TEST*/
   else if (key == 'b'){
    back = 106;
    light = 200;
    fillSpheres = 255;
    fillCircles = 206;
  }
}