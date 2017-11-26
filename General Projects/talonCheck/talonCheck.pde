int wins = 0;
int attempts = 0;
float rate;

void setup() {
  fullScreen();
  //size(100, 100);
  noCursor();
  strokeWeight(4);
}

void draw() {
  if (keyPressed) {
    wins = 0;
    attempts=0;
    rate=0;
  }
  background(0);
  if (attempts<3) {
    calc();
  }
  fill(0, 255, 0);
  rect(width/6, height, width/6, -height*rate);
  fill(255, 0, 0);
  rect(width-(width/3), height, width/6, -height*(1-rate));

  stroke(255);
  fill(255);
  textSize(32);
  textAlign(LEFT, TOP);
  text("Wins: "+wins, 10, 10);
  text("Attempts: "+attempts, 10, 50);
  text("Rate: "+rate*100+"%", 10, 90);
}

void calc() {
  int card = int(random(1, 8));
  if (card < 5) {
    wins+=1;
  } else {
    for (int i = 0; i<6; i++) {
      int card2 = int(random(1, 61-i));
      if (card2 < 5) {
        wins+=1;
      }
    }
  }
  attempts+=1;

  rate= float(wins) / float(attempts);

  println("wins: "+wins);
  println("attempts: "+attempts);
  println("rate: "+rate);
}