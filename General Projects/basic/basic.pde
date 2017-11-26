int basics = 7;

int tries = 0;
int card;
int completed=0;
int total=0;
float average;
boolean found=false;
int max=0;

void setup() {
  size(100, 100);
}

void draw() {
  if (keyPressed) {
    tries=0;
    found=false;
  }
  if (found == false) {
    for (int i=0; i<7; i++) {
      card = int(random(0, 60));
      if (card<basics) {
        found = true;
      }
    }
    tries+=1;
  } else {
    println("Found in "+tries+" tries");
    if (tries>max){
     max= tries; 
    }
    completed+=1;
    total+=tries;
    average=float(total)/float(completed);
    println("Max: "+max);
    println("Average: "+average+" tries");
    tries=0;
    found=false;
  }
}