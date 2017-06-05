//Inspirado en los ejemplos contenidos en el repositorio https://github.com/SableRaf/Filters4Processing

import processing.video.*;

PShader steinberg;
Capture cam;

void setup() {
  size(640, 480, P2D);
  steinberg = loadShader("steinberg.glsl");
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
    steinberg.set("sketchSize", (float)width, (float)height);
    filter(steinberg);
  }else if (key == 'e') {
    steinberg.set("sketchSize", (float)width, (float)height);
    filter(steinberg);
  }else if (key == 'r') {
    steinberg.set("sketchSize", (float)width, (float)height);
    filter(steinberg);
  }

}


void captureEvent(Capture c) {
  c.read();
}