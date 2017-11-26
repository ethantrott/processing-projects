boolean paused = false;
void keyPressed() {
  if (key=='s'||key=='S') {
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:", "fileSelected");
  } else if (key == 'g') {
    if (three == false) {
      three = true;
    } else {
      three = false;
    }
  } else if (key == ' ') {
    if (paused == false) {
      song.pause();
      xincrement = 0; 
      yincrement = 0; 
      xincrement1 = 0; 
      yincrement1 = 0; 
      xincrement2 = 0; 
      yincrement2 = 0; 
      paused = true;
    } else {
      song.play();
      paused = false;
    }
  }else if (key == 'r') {
    r = random(255)-72;
    g = random(255)-72;
    b = random(255)-72;
    scheme = "Custom";
  }else if (key == '1') {
    r = 0;
    g = 0;
    b = 27;
    scheme = "Default";
  }else if (key == '2') {
    r = 46;
    g = 0;
    b = 20;
    scheme = "Red";
  }else if (key == '3') {
    r = 0;
    g = 23;
    b = 11;
    scheme = "Green";
  }else if (key == '4') {
    r = 149;
    g = 137;
    b = 100;
    scheme = "Beige";
  }else if (key == '5') {
    r = 0;
    g = 0;
    b = 0;
    scheme = "Black";
  }else if (key == '6') {
    r = 39;
    g = 5;
    b = 68;
    scheme = "Purple";
  }else if (key == 'p') {
    println("("+int(r)+", "+int(g)+", "+int(b)+")");
  }else if (key == 'd'){
    if (dev == false){
      dev = true;
    }else{
      dev = false;
    }
  }
}