int num;
int newAmt = 1;
void setup(){
  size(100,100);
  surface.setResizable(true);
}

void draw(){
  num = int(random(0,10));
  
  String oldString[] = loadStrings("nums.txt");
  String string[] = new String[oldString.length];
  arrayCopy(oldString, string);
  string = expand(string, (oldString.length + newAmt));
  string[string.length] = "" + num;
  println("Line " + (string.length) + ": " + string[string.length]);
  saveStrings("C:/Users/ethan/Desktop/nums.txt", string);
  newAmt +=1;
  //*********************************************************//
  
  background(0);
  textAlign(CENTER, CENTER);
  textSize(54);
  text(num,width/2, height/2);
  textAlign(LEFT, TOP);
  textSize(34);
  text(string.length, 0, 0);
}