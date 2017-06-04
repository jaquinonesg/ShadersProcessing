void keyPressed() {
  if (key == '1') {
    println("No lights, no texture shading");
    selShader = colorShader;
    useLight = false;
    useTexture = false;        
  } else if (key == '2') {
    println("Vertex lights, no texture shading");
    selShader = lightShader;
    useLight = true;
    useTexture = false;    
  } else if (key == '3') {
    println("No lights, texture shading");
    selShader = texShader;
    useLight = false;
    useTexture = true;     
  } else if (key == '4') {
    println("Vertex lights, texture shading");
    selShader = texlightShader;
    useLight = true;
    useTexture = true;    
  } else if (key == '5') {
    println("Pixel lights, no texture shading");
    selShader = pixlightShader;
    useLight = true;
    useTexture = false; 
  } else if (key == '6') {
    println("Pixel lights, texture shading");
    selShader = texlightxShader;
    useLight = true;
    useTexture = true;      
  } else if (key == '7') {
    println("Black&white texture filtering");
    selShader = bwShader;
    useLight = false;
    useTexture = true;    
  } else if (key == '8') {
    println("Edge detection filtering");
    selShader = edgesShader;
    useLight = false;
    useTexture = true;    
  } else if (key == '9') {
    println("Emboss filtering");
    selShader = embossShader;
    useLight = false;
    useTexture = true;     
  }
}