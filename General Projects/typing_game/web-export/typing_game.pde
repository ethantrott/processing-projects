float c = random(1,27);
char x;
int score = 0;
float fTime = 0;
float secs = 0;
float cps;
void setup(){
  size(600,600);
}

void draw(){
  timeStuff();
  background(0);
  c_check();
  textSize(87);
  textAlign(CENTER, CENTER);
  text(x,width/2,height/2);
  textSize(21);
  textAlign(LEFT, TOP);
  text(score, 0, 0);
  textAlign(RIGHT, TOP);
}

void keyPressed(){
  if (key == x || key == '0'){
    c = random(1,27);
    score += 1;
  }
}
void c_check(){
  if (c<=2){
    x = 'a';
  }
  else if (c<=3 && c>2){
    x = 'b';
  }
  else if (c<=4 && c>3){
    x = 'c';
  }
  else if (c<=5 && c>4){
    x = 'd';
  }
  else if (c<=6 && c>5){
    x = 'e';
  }
  else if (c<=7 && c>6){
    x = 'f';
  }
  else if (c<=8 && c>7){
    x = 'g';
  }
  else if (c<=9 && c>8){
    x = 'h';
  }
  else if (c<=10 && c>9){
    x = 'i';
  }
  else if (c<=11 && c>10){
    x = 'j';
  }
  else if (c<=12 && c>11){
    x = 'k';
  }
  else if (c<=13 && c>12){
    x = 'l';
  }
  else if (c<=14 && c>13){
    x = 'm';
  }
  else if (c<=15 && c>14){
    x = 'n';
  }
  else if (c<=16 && c>15){
    x = 'o';
  }
  else if (c<=17 && c>16){
    x = 'p';
  }
  else if (c<=18 && c>17){
    x = 'q';
  }
  else if (c<=19 && c>18){
    x = 'r';
  }
  else if (c<=20 && c>19){
    x = 's';
  }else if (c<=21 && c>20){
    x = 't';
  }
  else if (c<=22 && c>21){
    x = 'u';
  }
  else if (c<=23 && c>22){
    x = 'v';
  }
  else if (c<=24 && c>23){
    x = 'w';
  }
  else if (c<=25 && c>24){
    x = 'x';
  }
  else if (c<=26 && c>25){
    x = 'y';
  }
  else if (c<=27 && c>26){
    x = 'z';
  }
}

void timeStuff(){
  fTime += 1;
  secs = fTime/frameRate;
  println(int(secs));
  
  cps = score/secs;
}