class Eye
{
  float eyeSize;
  float pupilSize;
  float eyeDistance;
  float eyeX;
  float eyeY;
  float pupilX;
  float pupilY;
  int presses2 = 0;
  int val2 = 1; 
  int prev_val2 = 1;

  Eye(float x, float y, float e)
  {
    eyeSize = 100; //40;
    pupilSize = 30;//15;
    eyeX = x;
    eyeY = y;
    eyeDistance = e;

    pupilX = eyeX;
    pupilY = eyeY;
  }

  void eyesStiff() {
    float mY = map(0, 0, height, -eyeSize/10, eyeSize/10);
    pupilY = eyeY + mY;

    float mX = map(0, 0, height/2, -eyeSize/10, eyeSize/10);
    pupilX = eyeX + mX;
  }
  
  //void eyesYummy() {
  //      if (val2==0 && prev_val2 == 1) {
  //    presses2 += 1;
  //    if (presses2>=5) {
  //      presses2=5;
  //      float mY = map(random(0, 500), 0, height, -eyeSize/10, eyeSize/8);
  //      pupilY = eyeY + mY;

  //      float mX = map(random(0, 500), 0, height, -eyeSize/10, eyeSize/8);
  //      pupilX = eyeX + mX;
  //    }
  //      }

  void update()
  {
    {
      if (sensorValues[0]>=1) {
        float mY = map(random(0, 500), 0, height, -eyeSize/7, eyeSize/7);
        pupilY = eyeY + mY;

        float mX = map(random(0, 500), 0, height, -eyeSize/7, eyeSize/7);
        pupilX = eyeX + mX;
      } else {
        eyesStiff();
      }
      
    if (sensorValues[1]>=0) {
      val = sensorValues[1];
    }
        if (presses2>=5) {
        presses2=5;
        float mY = map(random(0, 500), 0, height, -eyeSize/10, eyeSize/8);
        pupilY = eyeY + mY;

        float mX = map(random(0, 500), 0, height, -eyeSize/10, eyeSize/8);
        pupilX = eyeX + mX;
      }
    }
    }



void draw()
    {
      // stroke around eyeball
      fill(0);
      ellipse(eyeX, eyeY, eyeSize + 4, eyeSize + 4);

      // eyeball
      fill(255);
      ellipse(eyeX, eyeY, eyeSize, eyeSize);

      // pupil
      fill(0);
      ellipse(pupilX, pupilY, pupilSize, pupilSize);
    }
}
