//OTHER STUFF
size(650, 650);
background(#0060A7);

//INSIDE SQUARE
fill(#FF943B);
rect(10,10,630,630);

//DIAGONAL LINES
strokeWeight(4);
line(10,10,640,640);
line(10,640,640,10);

//MIDDLE CIRCLE
fill(#FA1414,155);
ellipse(325,325,100,100);

//CORNER CIRCLES
fill(#79FF81,150);
strokeWeight(7);
ellipse(10,10,200,200);
ellipse(640,10,200,200);
ellipse(640,640,200,200);
ellipse(10,640,200,200);


//BOARDER LINES
stroke(0);
strokeWeight(7);
line(110,10,540,10);
line(640,110,640,540);
line(540,640,110,640);
line(10,540,10,110);

