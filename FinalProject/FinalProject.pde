import geomerative.*;

RFont font;
String[] greeting = {"Hello", "Bonjour", "Hola", "Buon Giorno", "Guten Tag"};
int greetingIndex = 0;

float segmentStep = map(mouseX, mouseX, mouseX, 0, 20);

void setup() {
  size(1200, 600);  

  noStroke();

  RG.init(this);
  font = new RFont("OpenSans-Bold.ttf", 100, RFont.CENTER);

  // get the points on the curve's shape
  // set style and segment resultion

  RCommand.setSegmentLength(segmentStep);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}


void draw() {

  background(0);
  translate(width/2, height/2);

  if (greetingIndex < 5) {
    RGroup greetingGroup;
    greetingGroup = font.toGroup(greeting[greetingIndex]);
    greetingGroup = greetingGroup.toPolygonGroup();
    RPoint[] wordPoints = greetingGroup.getPoints();

    for (int i = 0; i < wordPoints.length; i++ ) {
      float circWidth = 5;
      if (i % 1 == 0) {
        if (greetingIndex == 1) {
          fill(0, 0, 240);
        } else {
          fill(255);
        }
        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth, circWidth);
      }
      if (i % 2 ==0) {
        fill(255, 0, 0);
        ellipse(wordPoints[i].x, wordPoints[i].y, circWidth, circWidth);
      }
    }
  }
}

void mouseClicked() {
  if (greetingIndex < 4) {
    greetingIndex ++;
  } else {
    greetingIndex = 0;
  }
}