import geomerative.*; // Importing the Geomerative Library
import processing.sound.*; // Importing the Processing Sound Library

// Variables for Geomerative Library
RFont font;
float segmentLength = random(1, 6);

// Variables for Arrays
String[] greeting = {"Hello", "Bonjour", "Hola", "Buon Giorno", "Guten Tag"};
String[] country = {"O Canada", "La Marseillaise", "Marcha Real", "Inno di Mameli", "Deutschlandlied"};
int arrayIndex = 0;

// SoundFile variables for voice lines
SoundFile englishClip;
SoundFile frenchClip;
SoundFile spanishClip;
SoundFile italianClip;
SoundFile germanClip;

// SoundFile variables for national anthems
SoundFile CanadaAnthem;
SoundFile FranceAnthem;
SoundFile SpainAnthem;
SoundFile ItalyAnthem;
SoundFile GermanyAnthem;

// Image variables for flags
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

// Variables for Flag particle system
ParticleSystem flagfall;
PImage CanFlagSmall;
PImage FreFlagSmall;
PImage SpaFlagSmall;
PImage ItaFlagSmall;
PImage GerFlagSmall;

void setup() {
  size(1000, 600);
  pixelDensity(2); // This line is included so the pixels look better and not pixelated on high resolution displays

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

  flagfall = new ParticleSystem(new PVector(width/2, -50));
  CanFlagSmall = loadImage("CanadaFlagSmall.jpg");
  FreFlagSmall = loadImage("FranceFlagSmall.jpg");
  SpaFlagSmall = loadImage("SpainFlagSmall.jpg");
  ItaFlagSmall = loadImage("ItalyFlagSmall.jpg");
  GerFlagSmall = loadImage("GermanyFlagSmall.jpg");


  // This is to play the sound clip on first load of the sketch.
  if (arrayIndex == 0) { // Canada
    englishClip.play();
  }
}

class ParticleSystem {
  ArrayList<Particle> flags;
  PVector generate;

  ParticleSystem(PVector pos1) {
    generate = pos1.copy();
    flags = new ArrayList<Particle>();
  }

  void moreFlags() {
    flags.add(new Particle(generate));
  }

  void runCanada() {
    for (int i = flags.size()-1; i >= 0; i--) {
      Particle p = flags.get(i);
      p.runCanada();
    }
  }

  void runFrance() {
    for (int i = flags.size()-1; i >= 0; i--) {
      Particle SmallFlag = flags.get(i);
      SmallFlag.runFrance();
    }
  }
  void runSpain() {
    for (int i = flags.size()-1; i >= 0; i--) {
      Particle SmallFlag = flags.get(i);
      SmallFlag.runSpain();
    }
  }
  void runItaly() {
    for (int i = flags.size()-1; i >= 0; i--) {
      Particle SmallFlag = flags.get(i);
      SmallFlag.runItaly();
    }
  }
  void runGermany() {
    for (int i = flags.size()-1; i >= 0; i--) {
      Particle SmallFlag = flags.get(i);
      SmallFlag.runGermany();
    }
  }
}


// A simple Particle class

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;

  Particle(PVector pos2) {
    acc = new PVector(0, 0.009);
    vel = new PVector(random(-4, 4), random(-3, 0));
    pos = pos2.copy();
  }

  // Run Method for countries
  void runCanada() {
    update();
    displayCanada();
  }
  void runFrance() {
    update();
    displayFrance();
  }
  void runSpain() {
    update();
    displaySpain();
  }
  void runItaly() {
    update();
    displayItaly();
  }
  void runGermany() {
    update();
    displayGermany();
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
  }

  // Display Country Flags
  void displayCanada() {
    translate(width/2, height/2);
    rotate(radians(frameCount));
    image(CanFlagSmall, pos.x, pos.y);
  }
  void displayFrance() {
    translate(width/2, height/2);
    rotate(radians(frameCount));
    image(FreFlagSmall, pos.x, pos.y);
  }
  void displaySpain() {
    translate(width/2, height/2);
    rotate(radians(frameCount));
    image(SpaFlagSmall, pos.x, pos.y);
  }
  void displayItaly() {
    translate(width/2, height/2);
    rotate(radians(frameCount));
    image(ItaFlagSmall, pos.x, pos.y);
  }
  void displayGermany() {
    translate(width/2, height/2);
    rotate(radians(frameCount));
    image(GerFlagSmall, pos.x, pos.y);
  }
}


void draw() {
  background(255);

  pushMatrix();
  
  //translate(width/2, height/2);
  //rotate(radians(frameCount));
  
  if (arrayIndex == 0) {
    flagfall.moreFlags();
    flagfall.runCanada();
  }
  if (arrayIndex == 1) {
    flagfall.moreFlags();
    flagfall.runFrance();
  }
  if (arrayIndex == 2) {
    flagfall.moreFlags();
    flagfall.runSpain();
  }
  if (arrayIndex == 3) {
    flagfall.moreFlags();
    flagfall.runItaly();
  }
  if (arrayIndex == 4) {
    flagfall.moreFlags();
    flagfall.runGermany();
  }

  popMatrix();
  /*
  pushMatrix();
   
   translate(width/2, height/2);
   rotate(radians(frameCount));
   
   if (arrayIndex == 0) {
   // smoothVar += (engViz.analyze() - smoothVar) * smoothness;
   // float engVizScale = smoothVar * (height/2) * scale;
   // fill(engVizScale/0.4, engVizScale/2, engVizScale-50);
   // rect(width/2, height/2, engVizScale, engVizScale);
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
   
   popMatrix(); */

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

        float circWidth1 = random(1, 5.1);
        float circWidth2 = random(1, 3.9);
        float circWidth3 = random(1, 4.67);

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

  // Press S to stop playing any of the anthems
  if (key == 's' || key == 'S') {
    CanadaAnthem.stop();
    FranceAnthem.stop();
    SpainAnthem.stop();
    ItalyAnthem.stop();
    GermanyAnthem.stop();
  }
}
