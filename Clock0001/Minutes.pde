class Minutes {

  float xPos;
  float yPos;
  float cWidth;
  float cHeight;
  float loch;
  float locv;

  Minutes(int _xPos, int _yPos, int _cWidth, int _cHeight) {
    xPos = _xPos;
    yPos = _yPos;
    cWidth = _cWidth;
    cHeight = _cHeight;
  } 


  void drawHand(int thisHand, int handLength, int timeIncrement, int dotRadius) {
    // reset the radius:
    radius = minRadius; 
    // calculate the next angle:   
    angle = maxAngle - thisHand*(2*PI/timeIncrement);
    //println(angle);
    // draw the hand, variable length: 
    for (int x = 0; x<=handLength; x++) {
      // get  the coordinates of the dot:
      loch = -radius * sin(angle) + offset;
      //println(loch);
      locv = -radius * cos(angle) + offset;
      //println(locv);

      // make the dot: 
      if (x == handLength) { 
        xPos = loch;
        yPos = locv;
        cWidth = dotRadius;
        cHeight = dotRadius;
        //ellipse(loch, locv, dotRadius + 18, dotRadius + 18);
      }
      // calculate a new radius for the next dot further out:
      radius = radius + (dotRadius * 4);
      // increment the dot counter:
      //   numDots++;
    }
  }


  void display(boolean onT) {
    stroke(0);
    if (onT==true) {
      fill(0, 255, 0);
    }
    else {
      noFill();
      stroke(0);
    }
    ellipse(xPos, yPos, cWidth, cHeight);
  }
}

