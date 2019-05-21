import processing.serial.*;
String myString = null;
Serial myPort;
int NUM_OF_VALUES=2;
int[] sensorValues;

final int Stage1Baby = 0;
final int Stage2Teen= 1;
final int Stage3Adult = 2; 

int state = Stage1Baby;

Timer timer;
Timer2 timer2;


void setup() {
  setupSerial();
  size (2000, 2000); 
  background (255);
  timer = new Timer(20000);
  timer2 = new Timer2(45000);
  timer.start();
  timer2.start();
  setup1(); 
  setup2(); 
  setup3();
}

void draw() {
  updateSerial();
  printArray(sensorValues);
  switch (state) {
  case 0:
    translate(width/2+200, height/2+150);
    drawForStage1Baby();
    break;

  case 1:
    translate(width/2+450, height/2+400);
    drawforStage2Teen();
    break;
  case 2:
    Stage3Adultdraw();
    break;
  }
  if (timer.isFinished()) {
    state = 1;
    timer.start();
  }
  if (timer2.isFinished2()) {
    state = 2;
    timer.start();
  }
}

void keyPressed(){
  if (key == '1') {
    state = 0;
  }
  if (key == '2') {
    state = 1;
  }
  if (key == '3') {
    state = 2;
  }
}
//void mousePressed() {

//  //if(key == CODED) {
//  state = 1;
//}
//}

//
// this could call functions too for each state
//
//switch (state) {
//  //
//case Stage1Baby:
//  state = Stage2Teen;
//  break;

//case Stage2Teen:
//  if (key == CODED) {
//    if (keyCode == RIGHT) {
//    } else if (keyCode == DOWN) {
//    } else if (keyCode == UP) {
//    } else if (keyCode == LEFT) {
//    } else {
//    }
//  }

//default:
//    println ("undefined state, error 107");
//    break;

void setupSerial() {
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[ 0 ], 9600);
  // WARNING!
  // You will definitely get an error here.
  // Change the PORT_INDEX to 0 and try running it again.
  // And then, check the list of the ports,
  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
  // and replace PORT_INDEX above with the index number of the port.

  myPort.clear();
  // Throw out the first reading,
  // in case we started reading in the middle of a string from the sender.
  myString = myPort.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
  myString = null;

  sensorValues = new int[NUM_OF_VALUES];
}



void updateSerial() {
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
    if (myString != null) {
      String[] serialInArray = split(trim(myString), ",");
      if (serialInArray.length == NUM_OF_VALUES) {
        for (int i=0; i<serialInArray.length; i++) {
          sensorValues[i] = int(serialInArray[i]);
        }
      }
    }
  }
}
