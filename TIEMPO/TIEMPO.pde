//Nicole Fernandez
// E4: Tiempo
//Este ejercicio representa una de las ideas centrales de la lectura de Judy Wajcman
//al representar el tiempo como una secuencia automatizada y cíclica, donde cada unidad
//de tiempo toma cierto protagonismo de forma rotativa siguiendo una lógica algorítmica.

int h;
int m;
int s;

void setup () {
  size (800, 800);
  frameRate (1);
  textAlign(CENTER, CENTER);
}

void draw () {
  background(0);

  h = hour();
  m = minute();
  s = second();

  noStroke();
  fill(239, 58, 58);
  ellipse(400, 400, 1200, 1200);
  fill(239, 58, 166);
  ellipse(400, 400, 1000, 1000);
  fill(227, 89, 234);
  ellipse(400, 400, 800, 800);
  fill(201, 182, 255);
  ellipse(400, 400, 600, 600);
  fill(114, 167, 214);
  ellipse(400, 400, 400, 400);
  fill(114, 214, 185);
  ellipse(400, 400, 200, 200);

  float bigSize = 100;
  float smallSize = 40;
  float hSize, mSize, sSize;

  if (s % 3 == 0) {
    hSize = bigSize;
    mSize = smallSize;
    sSize = smallSize;
  } else if (s % 3 == 1) {
    hSize = smallSize;
    mSize = bigSize;
    sSize = smallSize;
  } else {
    hSize = smallSize;
    mSize = smallSize;
    sSize = bigSize;
  }

  fill(255, 239, 235);
  textSize(hSize);
  text(nf(h, 2), 400, 320);
  fill (210, 246, 252);
  textSize(mSize);
  text(nf(m, 2), 400, 420);
  fill (244, 252, 210);
  textSize(sSize);
  text(nf(s, 2), 400, 520);
}
