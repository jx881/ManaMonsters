Monster3 monster3;

//import processing.serial.*;
//String myString = null;
//Serial myPort;
//int NUM_OF_VALUES=2;
//int[] sensorValues;

PImage heart;


int [] dna = {
  15, 15, 14, 15, 6};
int traitBits = 4;
int [] mutationMask;
float x, y, mySize, spin;
int blinkTime = 300;
int blinkTimer = blinkTime;
float lid = 1.5;

int presses3 = 0;
float cy3 = 200;
int val3 = 1; 
int prev_val3 = 1;
ArrayList<Chomp3> dinner3 = new ArrayList();



void setup3()
{
  //size(2000, 2000);
  heart = loadImage("humanheartnobg.png");
  noStroke();
  smooth();
  monster3 = new Monster3(14, 400);
  Eyesetup();
  setupWigglers();
  // setupSerial();
}

void eyePlacement() {
  push();
  scale(0.5);
  translate(width/2+900, height/2+1450);
  Eyedraw();
  pop();
  push();
  scale(0.5);
  translate(width/2+1900, height/2+1450);
  Eyedraw();
  pop();
  push();
  translate(width/2+450, height/2+250);
  Eyedraw();
  pop();
  push();
  scale(0.5);
  translate(width/2+1900, height/2+850);
  Eyedraw();
  pop();
  push();
  scale(0.5);
  translate(width/2+900, height/2+850);
  Eyedraw();
  pop();
}

void foodHuman() {
  image(heart, width/2+550, height/2+740);
  heart.resize(300, 300);
}

void Stage3AdultEat() {
  if (sensorValues[1]>=0) {
    val3 = sensorValues[1];
  }
  if (val3==0 && prev_val3 == 1) {
    presses3 += 1;

    if (presses3 > 2) {
      dinner3.add(new Chomp3(width/2+700, height/2+840, 190)); //+ presses2*20
    }
  }
  if (presses3 > 3) {
    dinner3.add(new Chomp3(width/2+750, height/2+955, 175));
  }
  if (presses3 > 1) {
    foodHuman();
  }
  if (presses3 > 4) {
    dinner3.add(new Chomp3(width/2+660, height/2+960, 177));
  }



    //dinner2.remove(0); //(new Chomp2(width/2-60, height+50, 170));
    //dinner2.remove(1); //new Chomp2(width/2+70, height/2+50, 170));
    //dinner2.remove(2); //new Chomp2(width/2, height/2-70, 170));
  

  print(presses2 + ",  ");
  for (int i=0; i < dinner3.size(); i++) { //you can now make as many as you want
    Chomp3 chom3 = dinner3.get(i);
    chom3.display();
  }
}

void Stage3Adultdraw()
{
  smooth();
  background(255);
  push();
  scale(5);
  translate(width/2-300, height/2-300);
  if (sensorValues[0]>=1) {
    drawWigglers();
  } else {
    drawStiffWigglers();
  }
  pop();
  push();
  translate(width/2+700, height/2+900);
  if (sensorValues[0]>=1) {
    monster3.draw();
  } else {
    monster3.stiffMouth();
  }
  pop();
  Stage3AdultEat();
  eyePlacement();
  prev_val2 = val2;
  println();
  //  updateSerial();
  //printArray(sensorValues);
}

//void setupSerial() {
//  printArray(Serial.list());
//  myPort = new Serial(this, Serial.list()[ 0 ], 9600);
//  // WARNING!
//  // You will definitely get an error here.
//  // Change the PORT_INDEX to 0 and try running it again.
//  // And then, check the list of the ports,
//  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
//  // and replace PORT_INDEX above with the index number of the port.

//  myPort.clear();
//  // Throw out the first reading,
//  // in case we started reading in the middle of a string from the sender.
//  myString = myPort.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
//  myString = null;

//  sensorValues = new int[NUM_OF_VALUES];
//}

//void updateSerial() {
//  while (myPort.available() > 0) {
//    myString = myPort.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
//    if (myString != null) {
//      String[] serialInArray = split(trim(myString), ",");
//      if (serialInArray.length == NUM_OF_VALUES) {
//        for (int i=0; i<serialInArray.length; i++) {
//          sensorValues[i] = int(serialInArray[i]);
//        }
//      }
//    }
//  }
//}
