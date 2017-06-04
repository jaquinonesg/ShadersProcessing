void keyPressed() {
  if (key == 'q') {
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
  }
}