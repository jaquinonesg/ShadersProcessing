void changeKernel(int xstart,int ystart,int xend,int yend,int matrixsize){
  if (key == 'm') {
    //Identidad
    float[][] matrix = { { 0, 0, 0 },
                         { 0, 1, 0 },
                         { 0, 0, 0 } }; 
    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'i') {
    //Blur
    float[][] matrix = { { 0.0625, 0.125, 0.0625 },
                         { 0.125,  0,25, 0.125 },
                         { 0.0625, 0.125, 0.0625 } };
    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'o') {
    //bottom sobel
    float[][] matrix = { { -1, -2, -1 },
                         {  0,  0,  0 },
                         {  1,  2,  1 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'p') {
    //emboss
    float[][] matrix = { { -2, -1, 0 },
                         { -1,  1, 1 },
                         {  0,  1, 2 } }; 
    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'j') {
    //left sobel
    float[][] matrix = { { 1, 0, -1 },
                         { 2, 0, -2 },
                         { 1, 0, -1 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'k') {
    //outline
    float[][] matrix = { { -1, -1, -1 },
                         { -1,  8, -1 },
                         { -1, -1, -1 } }; 
    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'l') {
    //right sobel
    float[][] matrix = { { -1, 0, 1 },
                         { -2, 0, 2 },
                         { -1, 0, 1 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'ñ') {
    //sharpen
    float[][] matrix = { {  0, -1, 0 },
                         { -1, 5, -1 },
                         {  0, -1, 0 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'n') {
    //top sobel
    float[][] matrix = { {  1,  2,  1 },
                         {  0,  0,  0 },
                         { -1, -2, -1 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  if (key == 'z') {
    float a0 = n0.getValue();
    float a1 = n1.getValue();
    float a2 = n2.getValue();
    float a3 = n3.getValue();
    float a4 = n4.getValue();
    float a5 = n5.getValue();
    float a6 = n6.getValue();
    float a7 = n7.getValue();
    float a8 = n8.getValue();
    float[][] matrix = { { a0, a1, a2 },
                         { a3, a4, a5 },
                         { a6, a7, a8 } }; 

    applyMatrix(xstart,ystart,xend,yend, matrix, matrixsize);
  }
  
}

void applyMatrix(int xstart,int ystart,int xend,int yend,float[][] matrix,int matrixsize){
   // Begin our loop for every pixel
   for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      // Each pixel location (x,y) gets passed into a function called convolution() 
      // which returns a new color value to be displayed.
      color c = convolution(x,y,matrix,matrixsize,movie);
      int loc = x + y*movie.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we have not walked off the edge of the pixel array
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  // Return the resulting color
  return color(rtotal,gtotal,btotal);
}