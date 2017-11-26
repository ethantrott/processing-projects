void done(){
  //surface.setSize(600,400);
  amount = shapes.size();
  //println("MINIMUM FRAMERATE REACHED: Score of " + shapes.size() + " spheres.");
  for (int i=0; i<shapes.size(); i++) {
    shapes.remove(i);
  }
  done = true;
}