int s = second();
int m = minute();
int h = hour();

String place;
String start;

boolean show = false;

void setup() {
  size(1024, 768);
  textAlign(CENTER, CENTER);
}

void draw() {
  s = second();
  m = minute();
  h = hour();
  println(h);
  if (h < 8 && h >= 7 && m < 32 && m >= 0 || 
    h < 9 && h >= 8 && m < 25 && m >= 10 
    || h < 10 && h >= 9 && m < 20 && m >= 12 
    || h < 11 && h >= 10 && m < 13 && m >= 5
    || h < 12 && h >= 11 && m < 7 && m >= 0
    || h < 13 && h >= 12 && m < 31 && m >= 20
    || h < 14 && h >= 13 && m < 25 && m >= 15) {
    show = true;
  } else {
    show = false;
  }

  if (show == true) {
    background(#2D54DE);
    textAlign(CENTER, CENTER);
    if (h < 8 && h >= 7 && m < 32 && m >= 0){
      place = "Pre-Calc";
      start = "7:30";
    }else if (h < 9 && h >= 8 && m < 25 && m >= 10){
      place = "AP Physics"; 
      start = "8:24";
    }else if (h < 10 && h >= 9 && m < 20 && m >= 12){
      place = "Spanish"; 
      start = "9:18";
    }else if (h < 11 && h >= 10 && m < 13 && m >= 5){
      place = "History"; 
      start = "10:12";
    }else if (h < 12 && h >= 11 && m < 7 && m >= 0){
      place = "Study Hall"; 
      start = "11:06";
    }else if (h < 13 && h >= 12 && m < 31 && m >= 20){
      place = "Biology"; 
      start = "12:30";
    }else if (h < 14 && h >= 13 && m < 25 && m >= 15){
      place = "English III"; 
      start = "1:24";
    }
    
    text("You should go to: "+ place, width/2, height/2);
    text("It starts @ "+ start, width/2, height/2+20);
  } else {
    background(0);
  }
  textAlign(RIGHT,TOP);
  text(h + ":" + m + ":" + s, width,0);
}