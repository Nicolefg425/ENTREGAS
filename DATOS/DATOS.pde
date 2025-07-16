Table table;
int nInteractions;

float[] postLikes;
float[] postComments;

void setup() {
  size (900, 900);

  table = loadTable ("teen_phone_addiction_dataset.csv");
  nInteractions = table.getRowCount();

  postLikes = new float [nInteractions];
  postComments = new float [nInteractions];

  for (int i = 0; i < nInteractions; i = i + 1) {
    postLikes[i] = table.getFloat(i, "Daily_Usage_Hours");
    postComments[i] = table.getFloat(i, "Sleep_Hours");
  }
}

void draw() {
  for (int i = 0; i < nInteractions; i = i + 1) {
    float x = map(postLikes[i], 0, max(postLikes), 0, width);
    float y = map(postComments[i], 0, max(postComments), 0, height);

    fill (random(40, 70), random(100, 140), random(200, 230));
    noStroke();
    triangle(x, y, x+4, y+4, x+12, y+12);
  }
}
