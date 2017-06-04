void drawCan( float centerx, float centery, float rotAngle) {
  pushMatrix();
  if (useLight) {
    pointLight(255, 255, 255, centerx, centery, 200);
  }    
  shader(selShader);  
    
  translate(centerx, centery, 65);
  rotateY(rotAngle);
  if (useTexture) {
    can.setTexture(label);
  } else {
    can.setTexture(null);
  }
  shape(can);
  noLights();
    
  resetShader();  
    
  pushMatrix();
  translate(0, canSize - 5, 0);  
  shape(cap);
  popMatrix();

  pushMatrix();
  translate(0, -canSize + 5, 0);  
  shape(cap);
  popMatrix();
  
  popMatrix();
}

PShape createCan(float r, float h, int detail, PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(tex);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

PShape createCap(float r, int detail) {
  PShape sh = createShape();
  sh.beginShape(TRIANGLE_FAN);
  sh.noStroke();
  sh.fill(128);
  sh.vertex(0, 0, 0);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    sh.vertex(x * r, 0, z * r);
  }  
  sh.endShape();
  return sh;  
}