boolean paused = false;

void keyPressed(){
  if (key == 'g'){
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
      xincrement = 0; 
      yincrement = 0; 
      xincrement1 = 0; 
      yincrement1 = 0; 
    }else{
      song.play();
      paused = false;
    }
  }
}