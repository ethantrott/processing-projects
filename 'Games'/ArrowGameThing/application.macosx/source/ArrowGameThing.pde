/*
*                    Arrow Game Thing
*                 Made by Ethan Trott
*
*      A game thing with arrows, arrays, and music
*/

//TO PLAY: Click Run to start, and then, move with A and D, jump with SPACEBAR, shoot Arrow with Left Click.//

void setup(){
    size(700,400);
    setup_stuff();
}

void draw(){
  background(#412b41);
  if (zOpacity == 0){
   score = score + 1;
 }
  draw_circles();
  hearts();
  fill(33,40,51,232);
  noStroke();
  rect(0,height,width,-height/5);
  zombie_stuff();
  archer_stuff();
  jump_check();
  check_movement();
  textFont(font);
  stroke(255);
  fill(255);
  if (score > 9){
    scoreX = width - 52;
  }
  if (score > 99){
    scoreX = width - 78;
  }
  if (score > 999){
    score = 999;
  }
  text(score,scoreX,height-10);
}

void keyPressed(){
  if (abs(ax-zx)<5){
    zOpacity = 0;
  }
}