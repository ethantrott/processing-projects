String oName = "Dragonite";
String dName = "Magikarp";

String oMove1 = "Hyper Beam";
String oMove2 = "Hurricane";
String oMove3 = "Outrage";
String oMove4 = "Dragon Rush";

String dMove1 = "Splash";
String dMove2 = "Tackle";

int oHP = 127;
int dHP = 32;

void setup(){
  size(800,600,P3D);
  setup_render();
}

void draw(){
  background(#21C172);
  render();
}