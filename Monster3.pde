class Monster3
{
  int maxMonster3Size;
  int numEyes3;
  float angle3;

  Eye3[] eyes3;

  Monster3(int nEyes3, int mSize3)
  {
    numEyes3 = nEyes3;
    maxMonster3Size = mSize3;

    angle3 = 360 / numEyes3;

    eyes3 = new Eye3[nEyes3];

    for (int i = 0; i < numEyes3; i++) {
      float eyeDistance3 = random(500, 750);
      float x = cos(radians(i*angle3)) * eyeDistance3;
      float y = sin(radians(i*angle3)) * eyeDistance3;
      eyes3[i] = new Eye3(x, y, eyeDistance3);
    }
  }
  
void stiffMouth() {
  {
    // monster body
    fill(0);
    ellipse(0, -270, 700, 700);
    ellipse(0, 0, 400, 400);

    // tentacles start
    for (int i = 0; i < numEyes3; i++) {
      float x = cos(radians(i*angle3)) * 100;
      float y = sin(radians(i*angle3)) * 100;
      ellipse(x, y, 400, 400);
    }

    // tentacles
    stroke(0);
    strokeWeight(40);
    noFill();
    for (int i = 0; i < numEyes3-7; i++) {
      float x1 = cos(radians(i*angle3)) * 45;
      float y1 = sin(radians(i*angle3)) * 45;

      float cx1 = cos(radians(i*angle3));// * (45 + random(eyes[i].eyeDistance/2));
      float cy1 = sin(radians(i*angle3));// * (45 + random(eyes[i].eyeDistance/2));

      float cx2 = cos(radians(i*angle3)) ;//* (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
      float cy2 = sin(radians(i*angle3)) ;//* (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));

      float x2 = cos(radians(i*angle3)) * (eyes3[i].eyeDistance3 - 10);
      float y2 = sin(radians(i*angle3)) * (eyes3[i].eyeDistance3 - 10);

      //if (cy1 == 0.0) {
      //  cy1 = y1 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}

      //if (cy2 == 0.0) {
      //  cy2 = y2 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}


    //  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    }
    noStroke();

    //// tentacles end
    //fill(0);
    //for (int i = 0; i < numEyes; i++) {
    //  float x = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
    //  float y = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
    //  //ellipse(x, y, 30, 30);
    //}

    // monster eyes
    //for (int i = 0; i < numEyes; i++) {
    //    eyes[i].update();
    //    eyes[i].draw();
    //}

    // monster mouth
    fill(255);

    beginShape();
    for (int i = 0; i < 30; i++) {
      float teethAngle3 = 360/30;
      if (i % 2 == 0) {
        float x = cos(radians(i*teethAngle3)) * 250;
        float y = sin(radians(i*teethAngle3)) * 250;
        vertex(x, y);
      } else {
        float teethSize3 = random(150, 155);
        float x = cos(radians(i*teethAngle3)) * teethSize3;
        float y = sin(radians(i*teethAngle3)) * teethSize3;
        vertex(x, y);
      }
    }
    endShape(CLOSE);
    }
}

  

  void draw()
  {
    // monster body
    fill(0);
    ellipse(0, -270, 700, 700);
    ellipse(0, 0, 400, 400);

    // tentacles start
    for (int i = 0; i < numEyes3; i++) {
      float x = cos(radians(i*angle3)) * 100;
      float y = sin(radians(i*angle3)) * 100;
      ellipse(x, y, 400, 400);
    }

    // tentacles
    stroke(0);
    strokeWeight(40);
    noFill();
    for (int i = 0; i < numEyes3-7; i++) {
      float x1 = cos(radians(i*angle3)) * 45;
      float y1 = sin(radians(i*angle3)) * 45;

      float cx1 = cos(radians(i*angle3)) * (45 + random(eyes3[i].eyeDistance3/2));
      float cy1 = sin(radians(i*angle3)) * (45 + random(eyes3[i].eyeDistance3/2));

      float cx2 = cos(radians(i*angle3)) * (eyes3[i].eyeDistance3 - random(eyes3[i].eyeDistance3/2));
      float cy2 = sin(radians(i*angle3)) * (eyes3[i].eyeDistance3 - random(eyes3[i].eyeDistance3/2));

      float x2 = cos(radians(i*angle3)) * (eyes3[i].eyeDistance3 - 10);
      float y2 = sin(radians(i*angle3)) * (eyes3[i].eyeDistance3 - 10);

      if (cy1 == 0.0) {
        cy1 = y1 + random(eyes3[i].eyeDistance3/2); // stiff tentacle problem
      }

      if (cy2 == 0.0) {
        cy2 = y2 + random(eyes3[i].eyeDistance3/2); // stiff tentacle problem
      }


    //  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    }
    noStroke();

    //// tentacles end
    //fill(0);
    //for (int i = 0; i < numEyes; i++) {
    //  float x = cos(radians(i*angle3)) * (eyes[i].eyeDistance - 10);
    //  float y = sin(radians(i*angle3)) * (eyes[i].eyeDistance - 10);
    //  //ellipse(x, y, 30, 30);
    //}

    // monster eyes
    //for (int i = 0; i < numEyes; i++) {
    //    eyes[i].update();
    //    eyes[i].draw();
    //}

    // monster mouth
    fill(255);

    beginShape();
    for (int i = 0; i < 30; i++) {
      float teethAngle3 = 360/30;
      if (i % 2 == 0) {
        float x = cos(radians(i*teethAngle3)) * 250;
        float y = sin(radians(i*teethAngle3)) * 250;
        vertex(x, y);
      } else {
        float teethSize3 = random(150, 250);
        float x = cos(radians(i*teethAngle3)) * teethSize3;
        float y = sin(radians(i*teethAngle3)) * teethSize3;
        vertex(x, y);
      }
    }
    endShape(CLOSE);
  }
}
