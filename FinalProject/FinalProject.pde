import geomerative.*; // Importing the Geomerative Library
import processing.sound.*; // Importing the Processing Sound Library

RFont font;
String[] greeting = {"Hello", "Bonjour", "Hola", "Buon Giorno", "Guten Tag"};
String[] country = {"O Canada", "La Marseillaise", "Marcha Real", "Inno di Mameli", "Deutschlandlied"};
int arrayIndex = 0;

// SoundFile variables
SoundFile englishClip;
SoundFile frenchClip;
SoundFile spanishClip;
SoundFile italianClip;
SoundFile germanClip;

SoundFile CanadaAnthem;
SoundFile FranceAnthem;
SoundFile SpainAnthem;
SoundFile ItalyAnthem;
SoundFile GermanyAnthem;

// Image Variables
PImage CanadaFlag;
PImage FranceFlag;
PImage SpainFlag;
PImage ItalyFlag;
PImage GermanyFlag;

// Variables for amplitude visualization
float scale = 5;
float smoothness = 0.25;
float smoothVar; 
Amplitude engViz;
Amplitude freViz;
Amplitude spaViz;
Amplitude itaViz;
Amplitude gerViz;


float segmentLength = random(1, 6);

void setup() {
  size(1000, 600);
  pixelDensity(2);

  noStroke();

  rectMode(CENTER);

  RG.init(this); // Initilizes the Geomerative Library
  font = new RFont("data/OpenSans-Bold.ttf", 100, RFont.CENTER); // Loads the font using the Geomerative Library, font size 100, center aligned.

  RCommand.setSegmentLength(segmentLength); // Get the points on the curve's shape and sets distance between them
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); // Sets segmentator style and sets the style (uniform length between segments)

  println("segmentLength: " + segmentLength);

  englishClip = new SoundFile(this, "hello.mp3");
  CanadaFlag = loadImage("CanadaFlag.jpg");
  CanadaAnthem = new SoundFile(this, "CanadaAnthem.mp3");
  //engViz = new Amplitude(this);
  //engViz.input(englishClip);

  frenchClip = new SoundFile(this, "bonjour.wav");
  FranceFlag = loadImage("FranceFlag.jpg");
  FranceAnthem = new SoundFile(this, "FranceAnthem.mp3");
  //freViz = new Amplitude(this);
  //freViz.input(frenchClip);

  spanishClip = new SoundFile(this, "hola.wav");
  SpainFlag = loadImage("SpainFlag.jpg");
  SpainAnthem = new SoundFile(this, "SpainAnthem.mp3");
  //spaViz = new Amplitude(this);
  //spaViz.input(spanishClip);

  italianClip = new SoundFile(this, "buongiorno.wav");
  ItalyFlag = loadImage("ItalyFlag.jpg");
  ItalyAnthem = new SoundFile(this, "ItalyAnthem.mp3");
  //itaViz = new Amplitude(this);
  //itaViz.input(italianClip);

  germanClip = new SoundFile(this, "gutentag.wav");
  GermanyFlag = loadImage("GermanyFlag.jpg");
  GermanyAnthem = new SoundFile(this, "GermanyAnthem.mp3");
  //gerViz = new Amplitude(this);
  //gerViz.input(germanClip);

  // This is to play the sound clip on first load of the sketch.
  if (arrayIndex == 0) { // Canada
    englishClip.play();
  }
}


void draw() {
  background(255);

  pushMatrix();

  translate(width/2, height/2);
  rotate(radians(frameCount));

  if (arrayIndex == 0) {
    /* smoothVar += (engViz.analyze() - smoothVar) * smoothness;
     float engVizScale = smoothVar * (height/2) * scale;
     fill(engVizScale/0.4, engVizScale/2, engVizScale-50);
     rect(width/2, height/2, engVizScale, engVizScale); */
    image(CanadaFlag, 100, 100);
  }

  if  (arrayIndex == 1) {
    image(FranceFlag, 150, 150);
  }
  if (arrayIndex == 2) {
    image(SpainFlag, 100, 100);
  }
  if (arrayIndex == 3) {
    image(ItalyFlag, 210, 210);
  }
  if (arrayIndex == 4) {
    image(GermanyFlag, 200, 200);
  }

  popMatrix();

  translate(width/2, height/2 + 25); // Translate the loaded outlined text to a specific position

  if (arrayIndex < 5) {

    // COUNTRY --------------------------------------------------------------------------

    if (key == 'a' || key == 'A') {

      RGroup countryGroup; // Creates new RGroup to hold objects in it
      countryGroup = font.toGroup(country[arrayIndex]); // RGroup will hold font and bring the words in the country array into the group
      countryGroup = countryGroup.toPolygonGroup(); // Polygons are created from countryGroup
      RPoint[] countryPoints = countryGroup.getPoints(); // Returns the points of the groups as an array

      for (int i = 0; i < countryPoints.length; i++) {
        float rectWidth1 = random(1, 5);
        float rectWidth2 = random(1, 5);
        float rectWidth3 = random(1, 5);

        if (i % 1 == 0) { 

          if (arrayIndex == 0) { // Canada
            fill(255, 0, 0); // Red
          }
          if (arrayIndex == 1) { // France
            fill(0, 35, 149); // Blue
          }
          if (arrayIndex == 2) { // Spain
            fill(198, 11, 30); // Red
          }
          if (arrayIndex == 3) { // Italy
            fill(0, 146, 70); // Green
          }
          if (arrayIndex == 4) { // Germany
            fill(0); // Black
          }
          rect(countryPoints[i].x, countryPoints[i].y, rectWidth1, rectWidth1);
        }

        if (i % 2 ==0) {

          if (arrayIndex == 0) { // Canada
            fill(255); // White
          }
          if (arrayIndex == 1) { // France
            fill(255); // White
          }
          if (arrayIndex == 2) { // Spain
            fill(255, 196, 0); // Yellow
          }
          if (arrayIndex == 3) { // Italy
            fill(255); // White
          }
          if (arrayIndex == 4) { // Germany
            fill(221, 0, 0); // Red
          }

          rect(countryPoints[i].x, countryPoints[i].y, rectWidth2, rectWidth2);
        }

        if (i % 3 == 0) { 

          if (arrayIndex == 0) { // Canada
            fill(255, 0, 0); // Red
          }
          if (arrayIndex == 1) { // France
            fill(237, 41, 57); // Red
          }
          if (arrayIndex == 2) { // Spain
            fill(198, 11, 30); // Red
          }
          if (arrayIndex == 3) { // Italy
            fill(206, 43, 55); // Red
          }
          if (arrayIndex == 4) { // Germany
            fill(255, 206, 0); // Yellow
          }

          rect(countryPoints[i].x, countryPoints[i].y, rectWidth1, rectWidth1);
        }
      }
    } 

    // GREETINGS --------------------------------------------------------------------------

    else {

      RGroup greetingGroup; // Creates new RGroup to hold objects in it
      greetingGroup = font.toGroup(greeting[arrayIndex]); // RGroup will hold font and bring the words in the greeting array into the group
      greetingGroup = greetingGroup.toPolygonGroup(); // Polygons are created from greetingGroup
      RPoint[] wordPoints = greetingGroup.getPoints(); // Returns the points of the groups as an array

      for (int i = 0; i < wordPoints.length; i++ ) {

        float circWidth1 = random(1, 5);
        float circWidth2 = random(1, 5);
        float circWidth3 = random(1, 5);

        if (i % 1 == 0) { 

          if (arrayIndex == 0) { // Canada
            fill(255, 0, 0); // Red
          }
          if (arrayIndex == 1) { // France
            fill(0, 35, 149); // Blue
          }
          if (arrayIndex == 2) { // Spain
            fill(198, 11, 30); // Red
          }
          if (arrayIndex == 3) { // Italy
            fill(0, 146, 70); // Green
          }
          if (arrayIndex == 4) { // Germany
            fill(0); // Black
          }

          ellipse(wordPoints[i].x, wordPoints[i].y, circWidth1, circWidth1);
        }

        if (i % 2 ==0) {

          if (arrayIndex == 0) { // Canada
            fill(255); // White
          }
          if (arrayIndex == 1) { // France
            fill(255); // White
          }
          if (arrayIndex == 2) { // Spain
            fill(255, 196, 0); // Yellow
          }
          if (arrayIndex == 3) { // Italy
            fill(255); // White
          }
          if (arrayIndex == 4) { // Germany
            fill(221, 0, 0); // Red
          }

          ellipse(wordPoints[i].x, wordPoints[i].y, circWidth2, circWidth2);
        }

        if (i % 3 == 0) { 

          if (arrayIndex == 0) { // Canada
            fill(255, 0, 0); // Red
          }
          if (arrayIndex == 1) { // France
            fill(237, 41, 57); // Red
          }
          if (arrayIndex == 2) { // Spain
            fill(198, 11, 30); // Red
          }
          if (arrayIndex == 3) { // Italy
            fill(206, 43, 55); // Red
          }
          if (arrayIndex == 4) { // Germany
            fill(255, 206, 0); // Yellow
          }

          ellipse(wordPoints[i].x, wordPoints[i].y, circWidth1, circWidth1);
        }
      }
    }
  }
}

// This mouseClicked function cycles the words in the greeting array
void mouseClicked() {

  if (arrayIndex < 4) {
    arrayIndex ++;
  } else {
    arrayIndex = 0;
  }

  println(mouseX);

  // These if statements play the sound clips
  if (arrayIndex == 0) { // Canada
    englishClip.play();
  }
  if (arrayIndex == 1) { // France
    frenchClip.play();
  }
  if (arrayIndex == 2) { // Spain
    spanishClip.play();
  }
  if (arrayIndex == 3) { // Italy
    italianClip.play();
  }
  if (arrayIndex == 4) { // Germany
    germanClip.play();
  }
}

void keyPressed() {

  // Press A to start playing a country's anthem
  if (key == 'a' || key == 'A') {
    if (arrayIndex == 0) { // Canada
      CanadaAnthem.play();
    }
    if (arrayIndex == 1) { // France
      FranceAnthem.play();
    }
    if (arrayIndex == 2) { // Spain
      SpainAnthem.play();
    }
    if (arrayIndex == 3) { // Italy
      ItalyAnthem.play();
    }
    if (arrayIndex == 4) { // Germany
      GermanyAnthem.play();
    }
  }

  // Press S to stop playing
  if (key == 's' || key == 'S') {
    if (arrayIndex == 0) { // Canada
      CanadaAnthem.stop();
    }
    if (arrayIndex == 1) { // France
      FranceAnthem.stop();
    }
    if (arrayIndex == 2) { // Spain
      SpainAnthem.stop();
    }
    if (arrayIndex == 3) { // Italy
      ItalyAnthem.stop();
    }
    if (arrayIndex == 4) { // Germany
      GermanyAnthem.stop();
    }
  }
}
