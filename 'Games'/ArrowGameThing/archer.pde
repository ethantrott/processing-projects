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