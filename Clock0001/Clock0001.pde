

/*
Animates a dot in a circle
 Angles are in radians (0 - 2*PI)
 */
PImage clock;
int hoursW = 38;
int hoursH = 38;
Hours[] dotsHour;
Minutes[] dotsMinute;
Seconds[] dotsSecond;

boolean on = false;

float maxAngle = 2.0 * PI;  // 360 degrees
float angle = maxAngle;            // the changing angle
int dotRadius = 20;
int minuteHandLength = 2;
int hourHandLength = 3;
int minRadius = dotRadius*hourHandLength;
int radius = minRadius;            //size of the circle
int loch = 0;               // x
int locv = 0;               // y
float offset = 400;
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


void setup() {
  size(800, 800);
  noStroke();
  //clock = loadImage("clocksmall.jpg");

  dotsHour = new Hours[12];

  for (int i = 0; i<dotsHour.length; i++) {
    dotsHour[i] = new Hours(((i * 50) + 20), 40, hoursW, hoursH);
    dotsHour[i].drawHand(i, hourHandLength, 12, dotRadius);
  }
  
  dotsMinute = new Minutes[60];

  for (int i = 0; i<dotsMinute.length; i++) {
    dotsMinute[i] = new Minutes(((i * 50) + 20), 40, hoursW, hoursH);
    dotsMinute[i].drawHand(i, minuteHandLength, 60, dotRadius);
  }
  
  dotsSecond = new Seconds[60];

  for (int i = 0; i<dotsSecond.length; i++) {
    dotsSecond[i] = new Seconds(((i * 50) + 20), 40, hoursW, hoursH);
    dotsSecond[i].drawHand(i, minuteHandLength, 60, dotRadius);
  }
}

void draw() {
  getTime();
  background(255);
  //image(clock, 0, 0);



  for (int i = 0; i<dotsHour.length; i++) {
    if (i == (h % 12)) {
      dotsHour[i].display(true);
    }
    else {
      dotsHour[i].display(false);
    }
  }
  
  
    for (int i = 0; i<dotsMinute.length; i++) {
    if (i == (h % 60)) {
      dotsMinute[i].display(true);
    }
    else {
      dotsMinute[i].display(false);
    }
  }
  
    for (int i = 0; i<dotsSecond.length; i++) {
    if (i == (s % 60)) {
      dotsSecond[i].display(true);
    }
    else {
      dotsSecond[i].display(false);
    }
  }


}





void getTime() {
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
}

