Numberbox giveMeDahNumberBoxes(String s,int xsize,int  ysize,int xpos,int ypos){
  Numberbox n0 = cp5.addNumberbox(s)
                   .setSize(xsize, ysize)
                   .setPosition(xpos, ypos)
                   .setValue(0)
                   ;          
  makeEditable(n0);
  return n0;
}

void giveDahButton(){
  cp5.addButton("Aplicar kernel")
     .setValue(128)
     .setPosition(90,235)
     //.setImages(imgs)
     .updateSize()
   ;
}