void giveMeDahNumberBoxes(){
  Numberbox n0 = cp5.addNumberbox("numbers0")
                   .setSize(40, 40)
                   .setPosition(60, 100)
                   .setValue(0)
                   ;
  Numberbox n1 = cp5.addNumberbox("numbers1")
                   .setSize(40, 40)
                   .setPosition(105, 100)
                   .setValue(0)
                   ;
  Numberbox n2 = cp5.addNumberbox("numbers2")
                   .setSize(40, 40)
                   .setPosition(150, 100)
                   .setValue(0)
                   ;
  Numberbox n3 = cp5.addNumberbox("numbers3")
                   .setSize(40, 40)
                   .setPosition(60, 145)
                   .setValue(0)
                   ;
  Numberbox n4 = cp5.addNumberbox("numbers4")
                   .setSize(40, 40)
                   .setPosition(105, 145)
                   .setValue(0)
                   ;
  Numberbox n5 = cp5.addNumberbox("numbers5")
                   .setSize(40, 40)
                   .setPosition(150, 145)
                   .setValue(0)
                   ;
  Numberbox n6 = cp5.addNumberbox("numbers6")
                   .setSize(40, 40)
                   .setPosition(60, 190)
                   .setValue(0)
                   ;
  Numberbox n7 = cp5.addNumberbox("numbers7")
                   .setSize(40, 40)
                   .setPosition(105, 190)
                   .setValue(0)
                   ;

  Numberbox n8 = cp5.addNumberbox("numbers8")
                   .setSize(40, 40)
                   .setPosition(150, 190)
                   .setValue(0)
                   ;                   
  makeEditable(n0);
  makeEditable(n1);
  makeEditable(n2);
  makeEditable(n3);
  makeEditable(n4);
  makeEditable(n5);
  makeEditable(n6);
  makeEditable(n7);
  makeEditable(n8);
}