PrintWriter output;
int num;
int done = 0;

void setup()
{
  size(600,600);
  surface.setResizable(true);
}

void draw() {
  if (done == 0){
    num = int(random(0,1000000000));
    
    String lines[] = loadStrings("C:/Users/ethan/Desktop/nums.txt");
    output=createWriter("C:/Users/ethan/Desktop/nums.txt");
    for(int i=0; i<lines.length ; i++)
    {
      output.println(lines[i]);
    }
    output.println(num);
    output.flush();

    println("Line " + (lines.length + 1) + ": " + num);
    
    background(0);
    textAlign(CENTER, CENTER);
    textSize(54);
    text(num,width/2, height/2);
    textAlign(LEFT, TOP);
    textSize(34);
    text(lines.length + 1, 0, 0);
    textAlign(RIGHT, TOP);
    textSize(34);

  }else if (done == 1){
    exit();
  }else if (done == 2){
    //YO YO YO//
  }
} 

void keyPressed(){
  if (key == 'g'){
    done = 1;
  }
  else if (key == ' '){
    if (done == 2){
      done = 0;
    }else{
      done = 2;
    }
  }
}