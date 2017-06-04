//Adaptacion del codigo del tutorial ubicado en https://processing.org/tutorials/pshader/
//Ejemplo 9.1

float canSize = 60;
PImage label;
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
PShader barrelShader;

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
  barrelShader = loadShader("barrelBlurChroma.glsl");
  
  selShader = texlightShader;
  useLight = true;
  useTexture = true;
  println("Vertex lights, texture shading");  
}

void draw() {    
  background(0);
  float x = 1.88 * canSize + (2 * canSize + 8);
  float y = 2 * canSize + (2 * canSize + 5);
  drawCan(x, y, angle);        
  angle += 0.01;
}