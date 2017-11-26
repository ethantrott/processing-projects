import ddf.minim.*;
import javax.swing.*;
Minim minim;
AudioPlayer player;
int x=1;

void setup()
{
  size(700, 700, P3D);
  final JFileChooser fc = new JFileChooser();
  int returnVal = fc.showOpenDialog(this);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
  File file = fc.getSelectedFile();
  minim = new Minim(this);
  player = minim.loadFile(file.getPath());
  player.play();
  }
}

void draw()
{
  background(0);
  
for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    stroke(255);
    line(x1, height/7 + player.left.get(i)*80, x2, height/7 + player.left.get(i+1)*80);
    line(x1, (height/7)*6 + player.right.get(i)*80, x2, (height/7)*6 + player.right.get(i+1)*80);
    noStroke();
    fill(105);
    ellipse((width/2-(width/3)),height/2,player.left.get(i)*150,player.left.get(i)*150);
    ellipse((width/2)+(width/3),height/2,player.right.get(i)*150,player.right.get(i)*150);
    fill(255);
    ellipse(width/2,height/2, player.mix.get(i)*300,player.mix.get(i)*300);
  }
}

void keyPressed(){
  player.pause();
  
  if(x < 0){
    player.play();
  }
  
  x = x * -1;
}
