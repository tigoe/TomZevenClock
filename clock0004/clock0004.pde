/*
Animates a dot in a circle
 Angles are in radians (0 - 2*PI)
 */

float maxAngle = 2.0 * PI;  // 360 degrees
float angle = maxAngle;            // the changing angle
int dotRadius = 8;
int minuteHandLength = 4;
int hourHandLength = 2;
int minRadius = dotRadius*hourHandLength;
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

int r = 0;
int g = 0;
int b = 255;
int brightRed = 200;
int trailLength = 15;
int fadeIncrement = brightRed /trailLength;

int s = 0;
int m = 0;
int h = 0;

PFont myFont;

void setup() {
  size(400,400);
  noStroke();
  background(0,0,0);
  myFont = loadFont("GaramondPremrPro-Med-18.vlw");
  textFont(myFont, 18);

}

void draw() {
  getTime();
   background(0);
   for (int i = 0; i < 60; i++) {
   fill (0, 255, 127);
drawHand(i, minuteHandLength, 12);
   }
 fill(127,155,127);
    ellipse(offset, offset, dotRadius, dotRadius);
fill(r,g,b);
  text(h + ":" + m + ":" + s, 20,20);
  drawHand(h % 12, hourHandLength, 12);
  drawHand(m % 60, minuteHandLength, 60);
  
    int secondLevel = 255-(millis()%1000);
  fill(r, g, secondLevel);
  drawHand(s, minuteHandLength, 60);

}


void drawHand(int thisHand, int handLength, int timeIncrement) {
  // reset the radius:
  radius = minRadius; 
  // calculate the next angle:   
  angle = maxAngle - thisHand*(2*PI/timeIncrement);
  // draw the hand, variable length: 
  for (int x = 0; x<=handLength; x++) {
    // get  the coordinates of the dot:
    loch = -radius * sin(angle) + offset;
    locv = -radius * cos(angle) + offset;    
    // make the dot: 
    if (x == handLength) { 
      ellipse(loch, locv, dotRadius, dotRadius);
    }
    // calculate a new radius for the next dot further out:
    radius = radius + (dotRadius * 4);
    // increment the dot counter:
    //   numDots++;
  }

}


void getTime() {
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
}
