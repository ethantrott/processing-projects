PImage off;
PImage def;
PImage plat;
PImage logo;

void setup_render(){
  off=loadImage("dragonite.gif");
  def=loadImage("magikarp.gif");
  plat = loadImage("platform.png");
  logo = loadImage("logo.png");
}

void render(){
  //Pokemon and Names and HP
  fill(0);
  textSize(16);
  textAlign(LEFT, BOTTOM);
  text(oName, 20, height-20);
  textAlign(RIGHT, TOP);
  text(dName, width-20, 20);
  textSize(12);
  textAlign(LEFT, BOTTOM);
  text(oHP + " HP Left", 20, height-5);
  textAlign(RIGHT, TOP);
  text(dHP + " HP Left", width-20, 40);
  image(plat, width/6, (height/6)*4 + 80, 130, 60);
  image(off, width/6, (height/6)*4, 120,120);
  image(plat, width/6*4, (height/6) + 80, 130, 60);
  image(def, width/6*4, (height/6)-20, 100,150);
  
  //Move Options
  stroke(0);
  strokeWeight(2);
  fill(#4494FA);
  rect(width/2, height/10*9, 600, 100);
  fill(0);
  line(width/4*3, height/10*9, width/4*3, height);
  line(width/2, (height/15*14.25), width, (height/15*14.25));
  textAlign(LEFT, TOP);
  text(oMove1+" (Press 1)",width/2+2,height/10*9+4);
  text(oMove2+" (Press 2)",width/4*3+2,height/10*9+4);
  text(oMove3+" (Press 3)",width/2+2,height/15*14.25+4);
  text(oMove4+" (Press 4)",width/4*3+2,height/15*14.25+4);
  
  //Logo
  image(logo, width/15, height/9, 400, 148);
}