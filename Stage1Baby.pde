//////arduino time baby (SWITCHREAD)
//import processing.serial.*;
//String myString1 = null;
//Serial myPort1;
//int NUM_OF_VALUES1=2;
//int[] sensorValues1;

//strawberry
PImage img;
//body big
float cW;
int sC = 100;
float a = 0;
float md;
float maxSpread = 400;
int presses = 0;
//int presses21 = 1;

// x and y locations of particles
float[] sx = new float[sC];
float[] sy = new float[sC];

// diameter 
float[] sd = new float[sC];

// x and y increments of particles
float[] six = new float[sC];
float[] siy = new float[sC];

// angle and angle increment of particle sin
float[] sa = new float[sC];
float[] sai = new float[sC];

//it's feeding time idiot
ArrayList<Chomp> dinner ;
float cy = 200;
int val = 1; 
int prev_val = 1;
//int val21 = 1;
//int prev_val21 = 1;

void setup1() {
  //fullScreen();
  //size(2000, 2000);
  cW = height/6;

  dinner = new ArrayList<Chomp>();

  //the expanding cirlces 
  for (int i=0; i<sC; i++) {
    sx[i] = width/2;
    sy[i] = height/2;
    sai[i] = random(100, 200);
    sd[i] = random(30, 60);
    six[i] = random(-maxSpread, maxSpread); //these commands make the circles go nuts
    siy[i] = random(-maxSpread, maxSpread);
  }
  md = dist(width/2, height/2, width, height); // this moves the eyes
  img = loadImage("Strawberrynobg.png"); // loads the strawberry

  //Arduino time baby
  //setupSerial();
  //String COM10 = Serial.list()[0]; //check what portname means 
  //myPort = new Serial(this, COM10, 9600);
}

void boyBody() {
  background(255);
  fill(0);
  noStroke();
  ellipse(width/2, height/2, cW+280, cW+280);
}

void boyEyes() { 
  float d = dist(width, height, sensorValues[0], sensorValues[0]);
  float dx = abs((d/md)-1);
  //println(dx);
  fill(0);
  ellipseMode(CENTER);
  stroke(255);
  //these be the eyes
  ellipse(width/2-70-dx*30, height/2, 50, 50); //these are the outereyes
  ellipse(width/2+70+dx*30, height/2, 50, 50); 
  noStroke(); 
  fill(255);
  ellipse(width/2-70-dx*30, height/2, 15, 15);
  ellipse(width/2+70+dx*30, height/2, 15, 15);
}

void boyMouth() {
  //hopefully this is mouth?
  fill(255);
  arc(width/2, height/2+70, 100, 100, 0, PI);
}


void boyGrow() {
  if (val2==0 && prev_val2 == 1) {
    presses2 += 1;
  }
  if (sensorValues[0]>=1) {
    float d = dist(width, height, sensorValues[0], sensorValues[0]);
    float dx = abs((d/md)-1);
    //println(dx);
    fill(0);
    for (int i=0; i<sC; i++) { //these make the cirlces go weird

      ellipse(sx[i], sy[i], sd[i] + dx * 200, sd[i] + dx *200 );
      sx[i]= sin(sa[i])*six[i] + width/2;
      sy[i]= sin(sa[i])*siy[i] + height/2;
      sa[i]+= TWO_PI/(sai[i]);
    }
  }
}



void boyStage1() {
  boyBody();
  boyGrow();
  boyEyes();
  // boyMouth();
}

void boyFoodBerry() {
  image(img, width/2-70, height/2+20);
  img.resize(150, 150);
}

void boyStageEat() {
  boyStage1();
  //boyFoodBerry(); 
  if (sensorValues[1]>=0) {
    val = sensorValues[1];

  }
if (val==0 && prev_val == 1) {
  presses += 1;

  if (presses > 2) {
    dinner.add(new Chomp(width/2, height/2 + presses*20, 120));
    fill(0);
  }
}
if (presses > 4) {
     fill(255, 0, 0);
     if (sensorValues[1]<=0) {
    ellipse(width/2-100, height/2+55, 75, 30);
    ellipse(width/2+100, height/2+55, 75, 30);
    fill(0);
    ellipse(width/2-100, height/2+22, 40, 30);
    ellipse(width/2+100, height/2+22, 40, 30);
     }
  presses = 5;
}



if (presses > 1) {
  boyFoodBerry();

}



print(presses + ",  ");
for (int i=0; i < dinner.size(); i++) { //you can now make as many as you want
  Chomp chom = dinner.get(i);
  chom.display();
}
}



void drawForStage1Baby() {
  //your boy will eat
  pushMatrix();
  print("Loop " + frameCount + ":  ");
  translate(width/2, height/2);
  boyStage1();
  boyStageEat(); 
  //    for (int i=0; i < dinner.size(); i++) { //you can now make as many as you want
  prev_val = val;
  popMatrix();
  //println();
  //updateSerial();
  //printArray(sensorValues);

  //// your boy will pet
  //updateSerial();
  //printArray(sensorValues);
  //// use the values like this!
  //// sensorValues[0] 
  //if (sensorValues[0]>0) {
  //  boyGrow();
  //}

  //for (int i = 0; i <200; i+=200) {
  //  boyGrow();
  //}

  //
}

////Arduino time SensorValuesMultiple
//void setupSerial1() {
//  printArray(Serial.list());
//  myPort1 = new Serial(this, Serial.list()[ 0 ], 9600);
//  // WARNING!
//  // You will definitely get an error here.
//  // Change the PORT_INDEX to 0 and try running it again.
//  // And then, check the list of the ports,
//  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
//  // and replace PORT_INDEX above with the index number of the port.

//  myPort1.clear();
//  // Throw out the first reading,
//  // in case we started reading in the middle of a string from the sender.
//  myString1 = myPort1.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
//  myString1 = null;

//  sensorValues1 = new int[NUM_OF_VALUES];
//}



//void updateSerial1() {
//  while (myPort1.available() > 0) {
//    myString1 = myPort1.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
//    if (myString1 != null) {
//      String[] serialInArray = split(trim(myString1), ",");
//      if (serialInArray.length == NUM_OF_VALUES) {
//        for (int i=0; i<serialInArray.length; i++) {
//          sensorValues1[i] = int(serialInArray[i]);
//        }
//      }
//    }
//  }
//}
