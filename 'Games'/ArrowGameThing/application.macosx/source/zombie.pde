void zombie_stuff(){
  zx = zx - zSpeed;
  
  if (abs(x-zx)<5){
    life = life -1;
    zx = 700;
    zOpacity = 255;
  }
  tint(255, zOpacity);
  image(z,zx,b,88,-170);
  
  if (zx < -88){
    zx = 750;
  }
  
  if (zOpacity == 0){
    ax = random(5000,10000);
    
    if (zSpeed < 4){
      zSpeed = zSpeed + 0.25;
    }
    
    oA = 0;
    zx = 700;
    zOpacity = 255;
  }
}