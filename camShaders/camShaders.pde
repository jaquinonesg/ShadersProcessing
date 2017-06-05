//Inspirado en los ejemplos contenidos en el repositorio https://github.com/SableRaf/Filters4Processing

import processing.video.*;
PImage noiseImage;

PShader steinberg;
PShader fisheyePincushion;
PShader dithering;
PShader edgeDetection;

Capture cam;

void setup() {
  size(640, 480, P2D);
  steinberg = loadShader("steinberg.glsl");
  fisheyePincushion = loadShader( "fisheyePincushion.glsl" );
  dithering = loadShader( "dithering.glsl" );
  edgeDetection = loadShader("edge.glsl");
  
  startCapture(width, height);
}

void startCapture(int w, int h) {
  cam = new Capture(this, w, h);
  cam.start();
}

void draw(){
  image(cam, 0, 0);
  if (key == 'q') {
    steinberg.set("sketchSize", (float)width, (float)height);
    filter(steinberg);
  }else if (key == 'w') {
    fisheyePincushion.set("sketchSize", float(width), float(height));
    fisheyePincushion.set("amount", sin(frameCount * 0.01) * 0.5 );
    filter( fisheyePincushion );
  }else if (key == 'e') {
    noiseImage  = loadImage( "noise.png" );
    dithering.set("sketchSize", float(width), float(height));
    dithering.set("noiseTexture", noiseImage);
    filter( dithering );
  }else if (key == 'r') {
    edgeDetection.set("sketchSize", float(width), float(height));
    filter(edgeDetection);
  }
}

void captureEvent(Capture c) {
  c.read();
}