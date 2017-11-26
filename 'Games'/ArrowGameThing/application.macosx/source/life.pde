void hearts(){
  tint(255,255);
  if (life < 1){
  exit();
  }
  if (life > 0){
  image(heart, 0,0,30,30);
  }
  if (life > 1){
  image(heart, 32,0,30,30);
  }
  if (life > 2){
  image(heart, 64,0,30,30);
  }
}