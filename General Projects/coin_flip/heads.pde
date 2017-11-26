void heads(){
  stroke(255);
  strokeWeight(4);
  fill(0,255,0);
  ellipse(width/2,height/2,300,300);
  textAlign(CENTER,CENTER);
  stroke(255);
  fill(255);
  textSize(64);
  text(nameH,width/2,height/2-6);
  textSize(48);
  text("(By "+ (h-t) + ")", width/2, height/2+70);
}