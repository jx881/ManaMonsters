Monster monster;
////arduino time baby (SWITCHREAD)
//import processing.serial.*;
//String myString2 = null;
//Serial myPort2;
//int NUM_OF_VALUES=2;
//int[] sensorValues2;

//Snakes
PImage photo;

//it's feeding time idiot
int presses2 = 0;
ArrayList<Chomp2> dinner2 = new ArrayList();
float cy2 = 200;
int val2 = 1; 
int prev_val2 = 1;
//float eyeSize;
//float pupilSize;
//float eyeDistance;
//float eyeX;
//float eyeY;
//float pupilX;
//float pupilY;
//int val3 = 1;
//int prev_val3 = 1;


void setup2()
{
  //size(2000, 2000);
  noStroke();
  smooth();
  photo = loadImage("Snakesnobg.png");
  monster = new Monster(14, 400);
  //setupSerial2();
}

void foodSnakes () {
  image(photo, width/2-140, height/2-120);

  photo.resize(250, 250);
}


void teenStage1() {
  smooth();
  background(255);
  push();
  translate(width/2, height/2);
  if (sensorValues[0]>=1) {
    monster.draw();
  } else {
    monster.drawStiff();
  }
  pop();
}


void teenStageEat () {
  teenStage1();

  if (sensorValues[1]>=0) {
    val2 = sensorValues[1];
  }
  if (val2==0 && prev_val2 == 1) {
    presses2 += 1;

    if (presses2 > 2) {
     
      push();
      translate(width/2, height/2);
      monster.teethYum();
      pop();
      dinner2.add(new Chomp2(width/2, height/2-70, 170)); //+ presses2*20
    } else {
      push();
      translate(width/2, height/2);
      monster.drawStiff();
      pop();
    }
  }
  if (presses2 > 3) {
    dinner2.add(new Chomp2(width/2+70, height/2+50, 170));
  }
  if (presses2 > 1) {
    foodSnakes();
  }
  if (presses2 > 4) {
    dinner2.add(new Chomp2(width/2-60, height/2+50, 170));
  }



  

    //dinner2.remove(0); //(new Chomp2(width/2-60, height+50, 170));
    //dinner2.remove(1); //new Chomp2(width/2+70, height/2+50, 170));
    //dinner2.remove(2); //new Chomp2(width/2, height/2-70, 170));

  print(presses2 + ",  ");
  for (int i=0; i < dinner2.size(); i++) { //you can now make as many as you want
    Chomp2 chom2 = dinner2.get(i);
    chom2.display();
  }
}



void drawforStage2Teen() {
  println("before");
  updateSerial();
  println("after");
  print("Loop " + frameCount + ":  ");    
  teenStage1(); 
  teenStageEat();
  //foodSnakes();
  prev_val2 = val2;
  println();
  //updateSerial();
  //printArray(sensorValues);
  //smooth();
  //background(255);
  //push();
  //translate(width/2, height/2);
  //if (sensorValues[0]>=1) {
  //  monster.draw();
  //} else {
  //  monster.drawStiff();
  //}
  //pop();
  //foodSnakes();


  //  println();

  //printArray(sensorValues);
}


//void setupSerial2() {
//  printArray(Serial.list());
//  myPort2 = new Serial(this, Serial.list()[ 0 ], 9600);
//  // WARNING!
//  // You will definitely get an error here.
//  // Change the PORT_INDEX to 0 and try running it again.
//  // And then, check the list of the ports,
//  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
//  // and replace PORT_INDEX above with the index number of the port.

//  myPort2.clear();
//  // Throw out the first reading,
//  // in case we started reading in the middle of a string from the sender.
//  myString2 = myPort2.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
//  myString2 = null;

//  sensorValues2 = new int[NUM_OF_VALUES];
//}

//void updateSerial2() {
//  while (myPort1.available() > 0) {
//    myString2 = myPort1.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
//    if (myString2 != null) {
//      String[] serialInArray = split(trim(myString2), ",");
//      if (serialInArray.length == NUM_OF_VALUES) {
//        for (int i=0; i<serialInArray.length; i++) {
//          sensorValues2[i] = int(serialInArray[i]);
//        }
//      }
//    }
//  }
//}
