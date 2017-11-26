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
    /*if (key == 'q' || key == 'Q'){
      zOpacity = 0;
    }
    */
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