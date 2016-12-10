import geomerative.*; // Importing the Geomerative Library
import processing.sound.*; // Importing the Processing Sound Library

RFont font;
String[] greeting = {"Hello", "Bonjour", "Hola", "Buon Giorno", "Guten Tag"};
int greetingIndex = 0;

// SoundFile variables
SoundFile englishClip;
/*
SoundFile frenchClip;
 SoundFile spanishClip;
 SoundFile italianClip;
 SoundFile germanClip; */

float segmentLength = random(1, 6);

void setup() {
  size(1200, 600);  

  noStroke();

  RG.init(this); // Initilizes the Geomerative Library
  font = new RFont("data/OpenSans-Bold.ttf", 100, RFont.CENTER); // Loads the font using the Geomerative Library, font size 100, center aligned.

  RCommand.setSegmentLength(segmentLength); // Get the points on the curve's shape and sets distance between them
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); // Sets segmentator style and sets the style (uniform length between segments)

  println("segmentLength: " + segmentLength);

  englishClip = new SoundFile(this, "hello.mp3");
  /*
  frenchClip = new SoundFile(this, "bonjour.mp3");
  spanishClip = new SoundFile(this, "hola.mp3");
  italianClip = new SoundFile(this, "buongiorno.mp3");
  germanClip = new SoundFile(this, "gutentag.mp3");
   */
}


void draw() {
  if (keyPressed == true) {
    background(0);
  } else {
    background(255);
  }

  translate(width/2, height/2); // Translate the loaded outlined text to a specific position

  if (greetingIndex < 5) {
    RGroup greetingGroup; // Creates new RGroup to hold objects in it
    greetingGroup = font.toGroup(greeting[greetingIndex]); // RGroup will hold font and bring the words in the greeting array into the group
    greetingGroup = greetingGroup.toPolygonGroup(); // Polygons are creatted from greetingGroup
    RPoint[] wordPoints = greetingGroup.getPoints(); // Returns the points of the groups as an array

    for (int i = 0; i < wordPoints.length; i++ ) {

      float circWidth = random(1, 5);
      float circWidth2 = random(1, 5);

      if (i % 1 == 0) { 

        if (greetingIndex == 0) {
          fill(0, 0, 240);
        }
        if (greetingIndex == 1) {
          fill(133, 33, 240);
          //englishClip.play();
        }
        if (greetingIndex == 2) {
          fill(0, 255, 240);
        }
        if (greetingIndex == 3) {
          fill(55, 24, 24);
        }
        if (greetingIndex == 4) {
          fill(13, 51, 123);
        }

        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth, circWidth);
      }

      if (i % 2 ==0) {

        if (greetingIndex == 0) {
          fill(12, 224, 123);
        }
        if (greetingIndex == 1) {
          fill(123, 233, 140);
          //englishClip.play();
        }
        if (greetingIndex == 2) {
          fill(212, 55, 90);
        }
        if (greetingIndex == 3) {
          fill(102, 224, 124);
        }
        if (greetingIndex == 4) {
          fill(143, 51, 23);
        }

        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth2, circWidth2);
      }
    }
  }
}

// This mouseClicked function cycles the words in the greeting array
void mouseClicked() {
  if (greetingIndex < 4) {
    greetingIndex ++;
  } else {
    greetingIndex = 0;
  }

  if (greetingIndex == 0) {
    englishClip.play();
  }

  if (greetingIndex >= 5) {
    greetingIndex = 1;
  }
}

/*void keyPressed() {
 if (key == 'a' || key == 'A'){
 background(0);
 } else {
 background(255);
 }
 } */
