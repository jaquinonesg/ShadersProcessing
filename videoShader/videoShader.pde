// Codigo trabajado a partir de algunos ejemplos del repositorio https://github.com/SableRaf/Filters4Processing 
import processing.video.*;
import controlP5.*;
ControlP5 cp5;
Numberbox n0,n1,n2,n3,n4,n5,n6,n7,n8;
int w = 150;

Movie movie;
PImage noiseImage;
PShader barrelBlurChroma;
PShader steinberg;
PShader bicubic;
PShader bilateral;
PShader ContrastSaturationBrightness;
PShader dithering;
PShader fisheyePincushion;

float barrel = 2.2;

void setup() {
  size(1280, 720, P2D);
  movie = new Movie(this, "cat.mp4");
  movie.loop();
  
  barrelBlurChroma = loadShader("barrelBlurChroma.glsl");
  steinberg = loadShader("steinberg.glsl");
  bicubic = loadShader( "bicubic.glsl" );
  bilateral = loadShader( "bilateral.glsl" );
  ContrastSaturationBrightness = loadShader("ContrastSaturationBrightness.glsl");
  dithering = loadShader( "dithering.glsl" );
  fisheyePincushion = loadShader( "fisheyePincushion.glsl" );

}

void draw() {  
  image(movie, 0, 0, width, height);
  if (key == 'q') {
    barrelBlurChroma.set("sketchSize", float(width), float(height));
    barrelBlurChroma.set("barrelPower", barrel);
    filter(barrelBlurChroma);
  }else if (key == 'w') {
    steinberg.set("sketchSize", (float)width, (float)height);
    barrelBlurChroma.set("barrelPower", barrel);
    filter(steinberg);
  }else if (key == 'e') {
    bicubic.set("sketchSize", float(width), float(height));
    bicubic.set("mode", mousePressed ? 0 : 1);
    float oscillation = map( sin(frameCount*0.005), -1.0, 1.0, 0.1, 0.5 );
    bicubic.set("zoomLevel", oscillation );
    filter(bicubic);
  }else if (key == 'r') {
    bilateral.set("sketchSize", float(width), float(height));
    filter( bilateral );
  }else if (key == 't') {
    float c = 1.0; // Contrast is maximum
    float s = map( mouseX / (float) width,  0.0, 1.0, 0.0, 1.5 ); // map the saturation to the horizontal position of the cursor
    float b = map( mouseY / (float) height, 0.0, 1.0, 0.3, 1.5 ); // map the brightness to the vertical position of the cursor
    ContrastSaturationBrightness.set( "contrast",   c );
    ContrastSaturationBrightness.set( "saturation", s );
    ContrastSaturationBrightness.set( "brightness", b );
    filter(ContrastSaturationBrightness);
  }else if (key == 'y') {
    noiseImage  = loadImage( "noise.png" );
    dithering.set("sketchSize", float(width), float(height));
    dithering.set("noiseTexture", noiseImage);
    filter( dithering );
  }else if (key == 'u') {
    fisheyePincushion.set("sketchSize", float(width), float(height));
    fisheyePincushion.set("amount", sin(frameCount * 0.01) * 0.5 );
    filter( fisheyePincushion );
  }else if (key == 'u') {
    
    int xstart = constrain(mouseX-w/2,0,img.width);
    int ystart = constrain(mouseY-w/2,0,img.height);
    int xend = constrain(mouseX+w/2,0,img.width);
    int yend = constrain(mouseY+w/2,0,img.height);
    int matrixsize = 3;
    loadPixels();
    //Blur
    float[][] matrix = { { 0.0625, 0.125, 0.0625 },
                         { 0.125,  0,25, 0.125 },
                         { 0.0625, 0.125, 0.0625 } };
    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
}

  


void movieEvent(Movie m) {
  m.read();
}

void keyPressed(){
if (key == 'q') {println("BarrelBlurChroma");}
else if (key == 'w') {println("FloydSteinberg");}
else if (key == 'e') {println("Bicubic");}
else if (key == 'r') {println("Bilateral");}
else if (key == 't') {println("ContrastSaturationBrightness");}
else if (key == 'y') {println("Dithering");}
else if (key == 'u') {println("fisheyePincushion");}

}