class Timer2 {
  int savedTime2; // When Timer started
  int totalTime2; // How long Timer should last


  Timer2(int tempTotalTime2) {
    totalTime2 = tempTotalTime2;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime2 = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished2() { 
    // Check how much time has passed
    int passedTime2 = millis()- savedTime2;
    if (passedTime2 > totalTime2) {
      return true;
    } else {
      return false;
    }
  }
}
