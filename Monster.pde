class Monster
{
  int maxMonsterSize;
  int numEyes;
  float angle;

  Eye[] eyes;

  Monster(int nEyes, int mSize)
  {
    numEyes = nEyes;
    maxMonsterSize = mSize;

    angle = 360 / numEyes;

    eyes = new Eye[nEyes];

    for (int i = 0; i < numEyes; i++) {
      float eyeDistance = random(400, 600);//random(100,250);
      float x = cos(radians(i*angle)) * eyeDistance;
      float y = sin(radians(i*angle)) * eyeDistance;
      eyes[i] = new Eye(x, y, eyeDistance);
    }
  }
  
  //void teethStiff() {
  //  fill(255);

  //  beginShape();
  //  for (int i = 0; i < 30; i++) {
  //    float teethAngle = 360/30;
  //    if (i % 2 == 0) {
  //      float x = cos(radians(i*teethAngle)) * 250;
  //      float y = sin(radians(i*teethAngle)) * 250;
  //      vertex(x, y);
  //    } else {
  //      float teethSize = random(220, 222);
  //      float x = cos(radians(i*teethAngle)) * teethSize;
  //      float y = sin(radians(i*teethAngle)) * teethSize;
  //      vertex(x, y);
  //    }
  //  }
  //  endShape(CLOSE);
  //}
    

  void teethYum() {
         fill(0);
    ellipse(0, 0, 400, 400);//(0, 0, 100, 100);

    // tentacles start
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * 100; //40
      float y = sin(radians(i*angle)) * 100;
      ellipse(x, y, 400, 400); //30
    }

    // tentacles
    stroke(0);
    strokeWeight(6);
    noFill();
    for (int i = 0; i < numEyes; i++) {
      float x1 = cos(radians(i*angle)) * 45;
      float y1 = sin(radians(i*angle)) * 45;

      float cx1 = cos(radians(i*angle));// * (45 + random(eyes[i].eyeDistance/2));
      float cy1 = sin(radians(i*angle));// * (45 + random(eyes[i].eyeDistance/2));

      float cx2 = cos(radians(i*angle));// * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
      float cy2 = sin(radians(i*angle));// * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));

      float x2 = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);

      //if (cy1 == 0.0) {
      //    cy1 = y1 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}

      //if (cy2 == 0.0) {
      //    cy2 = y2 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}

      bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    }
    noStroke();

    // tentacles end
    fill(0);
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      ellipse(x, y, 30, 30);
    }

    // monster eyes
    int presses2 = 0;
    for (int i = 0; i < numEyes; i++) {
      eyes[i].update();
      eyes[i].draw();
    }

    // monster mouth
    fill(255);

    beginShape();
    for (int i = 0; i < 30; i++) {
      float teethAngle = 360/30;
      if (i % 2 == 0) {
        float x = cos(radians(i*teethAngle)) * 250;
        float y = sin(radians(i*teethAngle)) * 250;
        vertex(x, y);
      } else {
        float teethSize = random(110, 220);
        float x = cos(radians(i*teethAngle)) * teethSize;
        float y = sin(radians(i*teethAngle)) * teethSize;
        vertex(x, y);
      }
    }
    endShape(CLOSE);
  }
    

  void drawStiff()
  {
    // monster body
    fill(0);
    ellipse(0, 0, 400, 400);//(0, 0, 100, 100);

    // tentacles start
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * 100; //40
      float y = sin(radians(i*angle)) * 100;
      ellipse(x, y, 400, 400); //30
    }

    // tentacles
    stroke(0);
    strokeWeight(6);
    noFill();
    for (int i = 0; i < numEyes; i++) {
      float x1 = cos(radians(i*angle)) * 45;
      float y1 = sin(radians(i*angle)) * 45;

      float cx1 = cos(radians(i*angle));// * (45 + random(eyes[i].eyeDistance/2));
      float cy1 = sin(radians(i*angle));// * (45 + random(eyes[i].eyeDistance/2));

      float cx2 = cos(radians(i*angle));// * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
      float cy2 = sin(radians(i*angle));// * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));

      float x2 = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);

      //if (cy1 == 0.0) {
      //    cy1 = y1 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}

      //if (cy2 == 0.0) {
      //    cy2 = y2 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      //}

      bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    }
    noStroke();

    // tentacles end
    fill(0);
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      ellipse(x, y, 30, 30);
    }

    // monster eyes
    int presses2 = 0;
    for (int i = 0; i < numEyes; i++) {
      eyes[i].update();
      eyes[i].draw();
    }

    // monster mouth
    fill(255);

    beginShape();
    for (int i = 0; i < 30; i++) {
      float teethAngle = 360/30;
      if (i % 2 == 0) {
        float x = cos(radians(i*teethAngle)) * 250;
        float y = sin(radians(i*teethAngle)) * 250;
        vertex(x, y);
      } else {
        float teethSize = random(180, 182);
        float x = cos(radians(i*teethAngle)) * teethSize;
        float y = sin(radians(i*teethAngle)) * teethSize;
        vertex(x, y);
      }
    }
    endShape(CLOSE);
  }
   
  
// regular tentacles
  void draw() {
    // monster body
    fill(0);
    ellipse(0, 0, 400, 400);//(0, 0, 100, 100);

    // tentacles start
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * 100; //40
      float y = sin(radians(i*angle)) * 100;
      ellipse(x, y, 400, 400); //30
    }

    // tentacles
    stroke(0);
    strokeWeight(6);
    noFill();
    for (int i = 0; i < numEyes; i++) {
      float x1 = cos(radians(i*angle)) * 45;
      float y1 = sin(radians(i*angle)) * 45;

      float cx1 = cos(radians(i*angle)) * (45 + random(eyes[i].eyeDistance/2));
      float cy1 = sin(radians(i*angle)) * (45 + random(eyes[i].eyeDistance/2));

      float cx2 = cos(radians(i*angle))* (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
      float cy2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));

      float x2 = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);

      if (cy1 == 0.0) {
        cy1 = y1 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      }

      if (cy2 == 0.0) {
        cy2 = y2 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
      }

      bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    }
    noStroke();

    // tentacles end
    fill(0);
    for (int i = 0; i < numEyes; i++) {
      float x = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      float y = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
      ellipse(x, y, 30, 30);
    }

    // monster eyes
    for (int i = 0; i < numEyes; i++) {
      eyes[i].update();
      eyes[i].draw();
    }

    // monster mouth
    fill(255);

    beginShape();
    for (int i = 0; i < 30; i++) {
      float teethAngle = 360/30;
      if (i % 2 == 0) {
        float x = cos(radians(i*teethAngle)) * 250;
        float y = sin(radians(i*teethAngle)) * 250;
        vertex(x, y);
      } else {
        float teethSize = random(130, 250);
        float x = cos(radians(i*teethAngle)) * teethSize;
        float y = sin(radians(i*teethAngle)) * teethSize;
        vertex(x, y);
      }
    }
    endShape(CLOSE);
  }
}
