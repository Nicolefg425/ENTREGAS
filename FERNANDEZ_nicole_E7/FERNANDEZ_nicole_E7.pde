Table table;
int nInteractions;

float[] postLikes;
float[] postComments;

float r = random(250, 255);
float g = random(150, 192);
float b = random(100, 210);

void setup() {
  size (1000, 600);

  table = loadTable ("social_media_engagement1.csv", "header");
  nInteractions = table.getRowCount();

  postLikes = new float [nInteractions];
  postComments = new float [nInteractions];

  for (int i = 0; i < nInteractions; i = i + 1) {
    postLikes[i] = table.getFloat(i, "likes");
    postComments[i] = table.getFloat(i, "comments");
  }
}

void draw() {
  background(0);
  drawGradientCircle(width / 2, height / 2, 600);

  for (int i = 0; i < nInteractions; i = i + 1) {
    float x = map(postLikes[i], 0, max(postLikes), 0, width);
    float y = map(postComments[i], 0, max(postComments), height, 0);

    fill (r, g, b);
    noStroke();
    rect(x, y, 15, 15);
  }
}

void keyPressed() {
  r = random (100, 200);
  g = random (50, 150);
  b = random (200, 255);
}

void drawGradientCircle(float cx, float cy, float maxDiameter) {
  noStroke();
  for (float d = 0; d < maxDiameter; d += 8) {
    
    float alpha = map(d, 0, maxDiameter, 180, 0);
    fill(70, 50, 110, alpha);
    ellipse(cx, cy, d, d);
  }
}
