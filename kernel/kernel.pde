//Codigo base tomado de https://processing.org/tutorials/pixels/
//Interfaz grafica basada en ejemplos del repositorio https://github.com/sojamo/controlp5
import controlP5.*;
ControlP5 cp5;

PImage img;
int w = 150;

void setup() {
  size(960, 720);
  frameRate(30);
  img = loadImage("un.jpg");
  cp5 = new ControlP5(this);
  giveMeDahNumberBoxes();
  giveDahButton();
}

void draw() {
  image(img,0,0);

  int xstart = constrain(mouseX-w/2,0,img.width);
  int ystart = constrain(mouseY-w/2,0,img.height);
  int xend = constrain(mouseX+w/2,0,img.width);
  int yend = constrain(mouseY+w/2,0,img.height);
  
  int matrixsize = 3;
  
  loadPixels();
  changeKernel(xstart,ystart,xend,yend,matrixsize);
  stroke(0);
  noFill();
  rect(xstart,ystart,w,w);
}

void keyPressed(){
  if (key == 'u') {println("Identidad");}
  if (key == 'i') {println("Blur");}
  if (key == 'o') {println("Bottom sobel");}
  if (key == 'p') {println("Emboss");}
  if (key == 'j') {println("Left sobel");}
  if (key == 'k') {println("Outlin");}
  if (key == 'l') {println("Right sobel");}
  if (key == 'ñ') {println("Sharpen");}
  if (key == 'm') {println("Top Sobel");}
  if (key == 'z') {println("Kernel Values");}
}