PImage img1;
PImage img2;
int index = 0;

boolean mariposaActiva = false;
boolean mariposaFija = false;
float mariposaX = 0;
float mariposaY = 0;

boolean fondoReactivo = false;

Nube miNube;
Arbol miArbol;
Tronco miTronco;
Petalo miPetalo;
CentroFlor miCentroFlor;
Tallo miTallo;
Pasto miPasto;

void setup () {
  size (900, 500);

  //Iniciar elementos
  miNube = new Nube (color(255), 50, 100, 2);
  miArbol = new Arbol (color (51, 114, 59), 50, 100, 2);
  miTronco = new Tronco (color (86, 63, 40), 50, 100, 2);
  miPetalo = new Petalo (color (255, 113, 235), 50, 100, 2);
  miCentroFlor = new CentroFlor (color (150, 140, 250), 50, 100, 2);
  miTallo = new Tallo (color (132, 198, 107), 50, 100, 2);
  miPasto= new Pasto (color (132, 198, 107), 50, 100, 2);

  //Cargar imagenes
  img1 = loadImage("capullo.png");
  img2 = loadImage("mariposa.png");
}


void draw () {
  if (fondoReactivo) {
    background(255, 180, 100);  
    fondoReactivo = false;     
  } else {
    background(156, 232, 255); 
  }

  loadImageEvent (index);

  //Dibujar elementos
  miNube.display();
  miArbol.display();
  miTronco.display();
  miPetalo.display();
  miCentroFlor.display();
  miTallo. display();
  miPasto.display();

  //Movimiento nube
  miNube.correr();

  //Movimiento mariposa
  if (mariposaActiva && !mariposaFija) {
    mariposaX = mouseX;
    mariposaY = mouseY;

    float florX = miCentroFlor.getX();
    float florY = miCentroFlor.getY();

    float distancia = dist(mariposaX, mariposaY, florX, florY);

    if (distancia < 30) {
      mariposaFija = true;
      mariposaActiva = false;
      mariposaX = florX;
      mariposaY = florY;
    }
  }

  //Dibujar mariposa
  if (mariposaActiva || mariposaFija) {
    image (img2, mariposaX - 50, mariposaY - 50, 90, 90);
  }

  if (index == 0) {
    image (img1, 246, 200, 70, 70);
  }
}


//Clase padre: Naturaleza
class Naturaleza {
  //Propiedades
  color c1;
  color c2;
  color c3;
  color c4;
  color c5;
  color c6;
  float posX;
  float posY;
  float velocidad;
}

//Clases hijas
class Nube extends Naturaleza {
  Nube (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c1 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }

  void display () {
    fill (c1);
    noStroke ();
    circle (posX, posY, 50);
    circle (posX+30, posY, 50);
    circle (posX+60, posY, 50);
    circle (posX+540, posY+50, 50);
    circle (posX+570, posY+50, 50);
    circle (posX+600, posY+50, 50);
  }
  void correr() {
    posX += velocidad;
    if ((posX + 600 >= width) || (posX <= 0)) {
      velocidad *= -1;
    }
  }
}

class Arbol extends Naturaleza {
  //Constructor
  Arbol (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c2 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }
  void display () {
    fill (c2);
    triangle (posX+180, posY+80, posX+80, posY+250, posX+270, posY+250);
  }
}

class Tronco extends Naturaleza {
  Tronco (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c3 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }
  void display () {
    fill (c3);
    rect (posX*4.2, posY*3.5, 40, 30);
  }
}

class Petalo extends Naturaleza {
  //Constructor
  Petalo (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c4 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }

  void display () {
    fill (c4);
    noStroke ();
    circle(posX*13, posY*3, 25);
    circle(posX*13.5, posY*3, 25);
    circle(posX*13, posY*3.25, 25);
    circle(posX*13.5, posY*3.25, 25);
  }
}

class CentroFlor extends Naturaleza {
  CentroFlor (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c5 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }

  void display () {
    fill (c5);
    noStroke ();
    circle(posX * 13.25, posY * 3.13, 27);
  }
  float getX() {
    return posX * 13.25;
  }
  float getY() {
    return posY * 3.13;
  }
}


class Tallo extends Naturaleza {
  Tallo (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c6 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }

  void display () {
    fill (c6);
    noStroke ();
    rect(posX*13.2, posY*3.28, 5, 58);
  }
}

class Pasto extends Naturaleza {
  Pasto (color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c6 = tempC;
    posX = tempPosX;
    posY = tempPosY;
    velocidad = tempVelocidad;
  }

  void display () {
    fill (c6);
    noStroke ();
    ellipse(430, 450, 1270, 150);
  }
}

//Interacciones
void keyPressed () {
  index ++;
  loadImageEvent (index);
}

void reiniciar() {
  index = 0;
  mariposaActiva = false;
  mariposaFija = false;
  loadImageEvent(index);
}

void loadImageEvent (int i) {
  switch (i) {
  case 0:
    println ("Capullo");
    img1 = loadImage ("capullo.png");
    mariposaActiva = false;
    mariposaFija = false;
    break;
  case 1:
    println ("Mariposa");
    mariposaActiva = true;
    mariposaFija = false;
    break;
  case 2:
    println ("Reiniciar");
    index = 0;
    mariposaFija = true;
    break;
  }
}
void mousePressed() {
  reiniciar();
}

void mouseMoved() {
  fondoReactivo = true;
}
