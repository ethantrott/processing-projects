void position(){
  if (keyPressed){
   if (key=='w'){
     posY-=speed;
   }else if (key=='s'){
     posY+=speed;
   }else if (key=='a'){
     posX-=speed;
   }else if (key=='d'){
     posX+=speed;
   }
  }
}