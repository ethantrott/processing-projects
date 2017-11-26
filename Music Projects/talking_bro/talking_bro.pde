import ddf.minim.*;
Minim minim;
AudioInput in;
PImage back;

int x=1;

void setup()
{
  fullScreen(P3D);
  //size(700,700,P3D);
  minim = new Minim(this);

  in = minim.getLineIn();

  back = loadImage("back.png");
  imageMode(CENTER);
}

void draw()
{
  background(0);
  image(back, width/2, height/2, 850, 718);
  noStroke();
  fill(0);
  ellipse(width/2-150, (height/2)-70, 60, 60);
  ellipse((width/2+150), (height/2)-70, 60, 60);
  fill(0);
  if (in.mix.get(12)*300 < 20) {
    ellipse(width/2, (height/2)+100, 300, 20);
  } else {
    ellipse(width/2, (height/2)+100, 300, in.mix.get(12)*300);
  }

  pushMatrix();
  translate(0, height/2+100);
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, in.bufferSize(), width/2-150, width/2+150 );
    float x2 = map( i+1, 0, in.bufferSize(), width/2-150, width/2+150 );
    stroke(0);
    line(x1, in.left.get(i)*80+425-(dist(x2,in.left.get(i),width/2,height/2)), x2, in.left.get(i+1)*80-425+(dist(x2,in.left.get(i+1),width/2,height/2)));
  }
  popMatrix();
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    } else
    {
      in.enableMonitoring();
    }
  }
}