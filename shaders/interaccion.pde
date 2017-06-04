void keyPressed() {
  if (key == 'q') {
    label = loadImage("magritte2.jpg");
    println("No lights, no texture shading");
    selShader = colorShader;
    useLight = false;
    useTexture = false;        
  } else if (key == 'w') {
    println("Vertex lights, no texture shading");
    selShader = lightShader;
    useLight = true;
    useTexture = false;    
  } else if (key == 'e') {
    println("No lights, texture shading");
    selShader = texShader;
    useLight = false;
    useTexture = true;     
  } else if (key == 'r') {
    println("Vertex lights, texture shading");
    selShader = texlightShader;
    useLight = true;
    useTexture = true;    
  } else if (key == 't') {
    println("Pixel lights, no texture shading");
    selShader = pixlightShader;
    useLight = true;
    useTexture = false; 
  } else if (key == 'y') {
    println("Pixel lights, texture shading");
    selShader = texlightxShader;
    useLight = true;
    useTexture = true;      
  } else if (key == 'u') {
    println("Black&white texture filtering");
    selShader = bwShader;
    useLight = false;
    useTexture = true;    
  } else if (key == 'i') {
    println("Edge detection filtering");
    selShader = edgesShader;
    useLight = false;
    useTexture = true;    
  } else if (key == 'o') {
    println("Emboss filtering");
    selShader = embossShader;
    useLight = false;
    useTexture = true;     
  }else if (key == 'a') {
    label = loadImage("magritte.jpg");
    println("Bicubic");
    selShader = bicubic;
    bicubic.set("sketchSize", float(width), float(height));
    bicubic.set("mode", mousePressed ? 0 : 1);
    float oscillation = map( sin(frameCount*0.005), -1.0, 1.0, 0.1, 0.5 );
    oscillation = 0.5;
    bicubic.set("zoomLevel", oscillation );
    filter(bicubic);
    useLight = false;
    useTexture = true;     
  }else if (key == 's') {
    println("Bilateral");
    label = loadImage("magritte.jpg");
    selShader = bilateral;
    bilateral.set("sketchSize", float(width), float(height));
    useLight = false;
    useTexture = true;
    filter( bilateral );
  }else if (key == 'f') {
    println("Dithering");
    label = loadImage("magritte.jpg");
    noiseImage  = loadImage( "noise.png" );
    dithering.set("sketchSize", float(width), float(height));
    dithering.set("noiseTexture", noiseImage);
    selShader = dithering;
    useLight = false;
    useTexture = true;     
    filter( dithering );
  }
}