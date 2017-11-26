import processing.sound.*;
SoundFile music;

int ballCount = 199;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

float ax = 1000;
float ay;
float zx = 700;

int o1 = 0;
int o2 = 255;
int o3 = 0;
int o4 = 0;
int o5 = 0;
int oA = 255;

PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
PImage arrow;
PImage z;
PImage heart;

float b;
float x;
float y;
int scale = 1;
int aSpeed = 20;

float pax = 1;
float zax = 1;

float zOpacity = 255;
float zSpeed = 1;

float life = 3;