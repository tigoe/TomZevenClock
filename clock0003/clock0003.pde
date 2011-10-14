/*
Animates a dot in a circle
 Angles are in radians (0 - 2*PI)
 */

float maxAngle = 2.0 * PI;  // 360 degrees
float angle = maxAngle;            // the changing angle
int dotRadius = 8;
int minRadius = dotRadius*3;
int radius = minRadius;            //size of the circle
float loch = 0;               // x
float locv = 0;               // y
float offset = 200;
int counter = 0;
int numCircles = 17;
int numDots = 0;
int maxDots = 36;
int currentDot = 0;
int thisDot = 0;

int r = 12;
int g = 75;
int b = 0;
int brightRed = 200;
int trailLength = 15;
int fadeIncrement = brightRed /trailLength;

Dot[] dotArray = new Dot[maxDots];

int s = 0;
int m = 0;
int h = 0;

PFont myFont;

void setup() {
  size(400,400);
  noStroke();
  background(0,0,0);
  myFont = loadFont("GaramondPremrPro-Med-18.vlw");
  textFont(myFont, 12);
  if (numDots == 0) {
    makeDots();
  }
}

void draw() {


  brightRed = 200;
  dotArray[currentDot].r = brightRed;
  dotArray[thisDot].update();

  for (int j = 1; j <= trailLength; j++) {
    brightRed = brightRed - fadeIncrement;
    if (currentDot - j >= 0) {
      thisDot = currentDot - j;
    } 
    else {
      thisDot = dotArray.length + (currentDot - j);
    }
    dotArray[thisDot].r = brightRed;
    dotArray[thisDot].update();
  }
  // pause every 3 dots:
  if (currentDot % 3 == 0) {
    //delay(250);
  }

  // increment currentDot:
  if(currentDot >= dotArray.length - 1) {
    currentDot = 0;

  } 
  else {
    currentDot++;
  }

}

void makeDots() {

for (int thisHand = 1; thisHand <=12; thisHand++) {
    for (int x = 0; x<=2; x++) {
    // get  the coordinates of the dot:
      loch = -radius * sin(angle) + offset;
      locv = -radius * cos(angle) + offset;    
      // make the dot:  
      dotArray[numDots] = new Dot(loch, locv, dotRadius, r, g, b);
      // text (numDots, loch+6, locv);
      // update the dot:
      dotArray[numDots].update();
      // calculate a new radius for the next dot further out:
      radius = radius + (dotRadius * 3);
      // increment the dot counter:
      numDots++;
    }
    // reset the radius:
    radius = minRadius; 
    // calculate the next angle:   
    angle = maxAngle - thisHand*(2*PI/12);
  }
}


void getTime() {
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
}

void putTime() {

}

/*
    Dot class
 */
class Dot {
  float x, y;
  int radius, r, g, b;

  Dot(float _x, float _y, int _radius, int _r, int _g, int _b) {
    x = _x;
    y = _y;
    radius = _radius;
    r = _r;
    g = _g;
    b = _b;

  }

  void update() {
    fill(r, g, b);
    ellipse(x, y, radius, radius);
  }

}

