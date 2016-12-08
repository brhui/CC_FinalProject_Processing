import geomerative.*; // Importing the Geomerative Library
import processing.sound.*; // Importing the Processing Sound Library

RFont font;
String[] greeting = {"Hello", "Bonjour", "Hola", "Buon Giorno", "Guten Tag"};
int greetingIndex = 0;

SoundFile englishClip;

float segmentLength = random(1, 5);

void setup() {
  size(1200, 600);  

  noStroke();

  RG.init(this); // Initilizes the Geomerative Library
  font = new RFont("data/OpenSans-Bold.ttf", 100, RFont.CENTER); // Loads the font using the Geomerative Library, font size 100, center aligned.

  RCommand.setSegmentLength(segmentLength); // Get the points on the curve's shape and sets distance between them
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); // Sets segmentator style and sets the style (uniform length between segments)

  println("segmentLength: " + segmentLength);

  englishClip = new SoundFile(this, "hello.mp3");
}


void draw() {

  background(0);
  translate(width/2, height/2); // Translate the loaded outlined text to a specific position

  if (greetingIndex < 5) {
    RGroup greetingGroup;
    greetingGroup = font.toGroup(greeting[greetingIndex]);
    greetingGroup = greetingGroup.toPolygonGroup();
    RPoint[] wordPoints = greetingGroup.getPoints();

    for (int i = 0; i < wordPoints.length; i++ ) {

      float circWidth = 5;

      if (i % 1 == 0) {

        if (greetingIndex == 0) {
          fill(0, 0, 240);
        }
        if (greetingIndex == 1) {
          fill(133, 33, 240);
          englishClip.play();
        }
        if (greetingIndex == 2) {
          fill(0, 0, 240);
        }
        if (greetingIndex == 3) {
          fill(0, 0, 240);
        }
        if (greetingIndex == 4) {
          fill(0, 0, 240);
        }

        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth, circWidth);
      }

      if (i % 2 ==0) {
        fill(255, 0, 0);
        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth, circWidth);
      }
    }

    /*if (greetingIndex == 1){
     englishClip.play();
     } */
  }
}

void mouseClicked() {
  if (greetingIndex < 4) {
    greetingIndex ++;
  } else {
    greetingIndex = 0;
  }
}