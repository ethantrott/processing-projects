//I'll do stuff here sometime...maybe
float disRate = 7.5;

void drawOpt(){
  if (frameRate < 47){
    disRate += 0.25;
  }else if (frameRate > 58){
    if (disRate > 7.5){
      disRate -= 0.25;
    }
  }
}