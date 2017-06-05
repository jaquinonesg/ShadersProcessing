//Adaptacion del codigo del tutorial ubicado en https://processing.org/tutorials/pshader/
//Ejemplo 9.1

float canSize = 60;
PImage label, noiseImage;
PShape can;
PShape cap;
float angle;

PShader selShader;
boolean useLight;
boolean useTexture;

PShader colorShader;
PShader lightShader;
PShader texShader;
PShader texlightShader;
PShader pixlightShader;
PShader texlightxShader;
PShader bwShader;
PShader edgesShader;
PShader embossShader;
PShader bicubic;
PShader bilateral;
PShader ContrastSaturationBrightness;
PShader dithering;
PShader fisheyePincushion;
PShader steinberg;
PShader gaussianBlur;
PShader pixelate;

void setup() {
  size(480, 480, P3D);  
  label = loadImage("magritte2.jpg");
  can = createCan(1.6*canSize, 3.5 * canSize, 32, label);
  cap = createCap(canSize, 32);
  
  colorShader = loadShader("colorfrag.glsl", "colorvert.glsl");
  lightShader = loadShader("lightfrag.glsl", "lightvert.glsl");  
  texShader = loadShader("texfrag.glsl", "texvert.glsl");
  
  texlightShader = loadShader("texlightfrag.glsl", "texlightvert.glsl");
  pixlightShader = loadShader("pixlightfrag.glsl", "pixlightvert.glsl");
  texlightxShader = loadShader("pixlightxfrag.glsl", "pixlightxvert.glsl");
  
  bwShader = loadShader("bwfrag.glsl");
  edgesShader = loadShader("edgesfrag.glsl");
  embossShader = loadShader("embossfrag.glsl");
  bicubic = loadShader("bicubic.glsl");
  bilateral = loadShader( "bilateral.glsl" );
  ContrastSaturationBrightness = loadShader("ContrastSaturationBrightness.glsl");
  dithering = loadShader( "dithering.glsl" );
  fisheyePincushion = loadShader( "fisheyePincushion.glsl" );
  steinberg = loadShader("steinberg.glsl");
  gaussianBlur = loadShader("gaussianBlur.glsl");
  pixelate = loadShader("pixelate.glsl");
  
  selShader = texlightShader;
  useLight = true;
  useTexture = true;
}

void draw() {    
  background(0);
  float x = 1.88 * canSize + (2 * canSize + 8);
  float y = 2 * canSize + (2 * canSize + 5);
  drawCan(x, y, angle);        
  angle += 0.01;
  if (key == 'd') {
    println("ContrastSaturationBrightness");
    label = loadImage("magritte2.jpg");
    selShader = ContrastSaturationBrightness;
    float c = 1.0; // Contrast is maximum
    float s = map( mouseX / (float) width,  0.0, 1.0, 0.0, 1.5 ); // map the saturation to the horizontal position of the cursor
    float b = map( mouseY / (float) height, 0.0, 1.0, 0.3, 1.5 ); // map the brightness to the vertical position of the cursor
    ContrastSaturationBrightness.set( "contrast",   c );
    ContrastSaturationBrightness.set( "saturation", s );
    ContrastSaturationBrightness.set( "brightness", b );
    useLight = false;
    useTexture = true;
    filter(ContrastSaturationBrightness);
   }else if (key == 'g') {
    println("fisheyePincushion");
    label = loadImage("magritte.jpg");
    selShader = fisheyePincushion;
    fisheyePincushion.set("sketchSize", float(width), float(height));
    fisheyePincushion.set("amount", sin(frameCount * 0.01) * 0.5 );
    useLight = false;
    useTexture = true;
    filter( fisheyePincushion );
  }else if (key == 'h') {
    println("steinberg");
    label = loadImage("magritte.jpg");
    selShader = steinberg;
    steinberg.set("sketchSize", (float)width, (float)height);
    useLight = false;
    useTexture = true;
    filter(steinberg);
  }else if (key == 'j') {
    println("gaussianBlur");
    label = loadImage("magritte2.jpg");
    selShader = gaussianBlur;
    gaussianBlur.set("sketchSize", (float)width, (float)height);
    gaussianBlur.set("kernelSize", 32);
    gaussianBlur.set("strength", 7.0);
    float strength = map( mouseX, 0.0, width, 0.1, 9.0);
    int kernelSize = (int) map( mouseY, 0.0, height, 3.0, 32.0);
    gaussianBlur.set("strength", strength); 
    gaussianBlur.set("kernelSize", kernelSize);
    // Vertical pass
    gaussianBlur.set("horizontalPass", 0);
    filter(gaussianBlur);
    // Horizontal pass
    gaussianBlur.set("horizontalPass", 1);
    filter(gaussianBlur);
  // Show the values on screen
    //noStroke();
    //fill(0, 100);
    //rect(5,5,130,45);
    //fill(255);
    //text("kernel size =" + kernelSize, 10, 20);
    //text("blur strength =" + nf(strength, 1, 2), 10, 40);
    useLight = false;
    useTexture = true;
    filter(gaussianBlur);
  }else if (key == 'k') {
    println("Pixelate");
    selShader = pixelate;
    pixelate.set("sketchSize", float(width), float(height));
    float oscillation = makeEven(floor(map( sin(frameCount*0.01), -1.0, 1.0, 2, width )));
    float offset_x = makeEven(width % oscillation * 0.5f);
    float offset_y = makeEven(height % oscillation * 0.5f);
    pixelate.set("pixelSize", oscillation );
    pixelate.set("offset", offset_x, offset_y );
    useLight = true;
    useTexture = false;
    filter( pixelate );
  }else if (key == 'x') {
    useLight = false;
    useTexture = true;

  }else if (key == 'c') {
    useLight = true;
    useTexture = true;

  }
}

int makeEven(float source) {
  return floor(source / 2f) * 2;
}