PImage mom3; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int index = 0;

//Sonido
import processing.sound.*;
import processing.sound.FFT;
SoundFile soundfile;
FFT fft;

int bands = 512;
float[] spectrum = new float[bands];

//Tiempo de los efectos
int startMillis;
float inicioMomento3 = 43.0;
float duracionMomento3 = 27.0;
float inicioMomento4 = 70.0;
float duracionMomento4 = 29.0;

boolean sonidoIniciado = false;
boolean mostrarTexto = true;

//Letra
String[] letras = {
  "Try to do the right thing and please karma", // 0.0
  "All I want to know is where the fuck did ya have to go?", // 3.5
  "I've been waitin' on you, baby", // 7.0
  "Why don't you leave and come on home?", // 9.5
  "I can't be mad, I'm livin' my dream", // 13.0
  "Though you said you think you love me", // 16.5
  "So I've been fuckin' all these hoes and I've been blowin' all this cash", // 20.0
  "'Cause baby, this just the beginnin' and I'ma make all of it back", // 24.0
  "Where'd you go? What'd you do?", // 28.0
  "How the hell you make me fall in love with you?", // 30.5
  "And then you leave, now you're gone", // 33.5
  "All I got is this damn song", // 36.0
  "So I can feel, but I can't touch", // 39.0
  "You said my love was a bit too much", // 41.5
  "Broke my heart, can't find no crutch, so why don't you come on back home?", // 45.0
  "It's all good, everybody tryna eat tonight", // 49.0
  "Tryna go to sleep, havin' good dreams tonight", // 51.5
  "You go home, it might get better", // 54.5
  "All I know, it don't last forever", // 57.5
  "So take it while you got it, try to get a little more", // 60.5
  "They say I'm gettin' better than I ever been before"             // 63.0
};

float[] tiempoLetra = {
  43.0, 45.0, 47.0, 49.0, 51.0, 53.0, 55.0, 57.0, 59.0, 61.0,
  63.0, 65.0, 67.0, 69.0, 71.0, 73.0, 75.0, 77.0, 79.0, 81.0, 83.0
};


PFont fuente;

void setup() {
  size (900, 900);
  println(" Presiona la barra espaciadora para quitar la letra");
  // Fuente para letras
  fuente = createFont("Arial", 20);
  textFont(fuente);

  //Imagenes
  mom3 = loadImage ("momento3.png");

  //Sonido
  soundfile = new SoundFile(this, "lovelost.mp3");
  fft = new FFT (this, bands);
  fft.input (soundfile); //<>//
 //<>//
  // Empieza el audio en el segundo 43 //<>//
  soundfile.cue(0);
  soundfile.play(); //<>//
  startMillis = millis(); //<>//
  sonidoIniciado = true;
}

void draw () {
  background (0);
  float currentTime = (millis() - startMillis) / 1000.0;
  float tiempoRelativo = currentTime;

  // Mostrar letra
  String lineaActual = "";
  for (int i = 0; i < tiempoLetra.length; i++) {
    if (tiempoRelativo >= tiempoLetra[i]) {
      lineaActual = letras[i];
    }
  }

  if (sonidoIniciado) {
    fft.analyze(spectrum);

    // Calcula cuántas imágenes mostrar
    float totalEnergy = 0;
    for (int i = 0; i < bands; i++) {
      totalEnergy += spectrum[i];
    }

    //Momento 3
    if (currentTime >= inicioMomento3 && currentTime < inicioMomento3 + duracionMomento3)
    {
      loadImageEvent (index);

      // Escala de cantidad de imágenes
      int numImages = int(map(totalEnergy, 0, 10, 1, 50));
      numImages = constrain(numImages, 1, 100);

      // Dibuja imágenes según la energía
      for (int i = 0; i < numImages; i++) {
        float x = random(width);
        float y = random(height);
        float sizeFactor = random(0.2, 0.5);
        image(mom3, x, y, mom3.width * sizeFactor, mom3.height * sizeFactor);
      }
    } else if (currentTime >= inicioMomento4 && currentTime < inicioMomento4 + duracionMomento4) {
      // Momento 4: espiral
      pushMatrix();  // ← Nuevo
      translate(width / 2, height / 2);

      int levels = 8;
      float baseRadius = map(totalEnergy, 0, 10, 250, 280);
      baseRadius = constrain(baseRadius, 150, 280);

      for (int i = levels; i > 0; i--) {
        int num = i * 5;
        float r = baseRadius * i / levels;

        for (int j = 0; j < num; j++) {
          float angle = TWO_PI * j / num;
          float x = cos(angle) * r;
          float y = sin(angle) * r;
          fill(255, 100 + i * 20, 150, 180);
          ellipse(x, y, r / 3, r / 3);
        }
      }

      popMatrix();  // ← Nuevo
    }
  }
  // Mostrar letra al final para que no quede oculta
  if (lineaActual != "" && mostrarTexto) {
    fill(255);
    textFont(fuente);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(lineaActual, width / 2, height * 0.88);
  }
}
void loadImageEvent (int i) {
  switch (i) {
  default:
    image(mom3, 0, 0, width, height);
  }
}

void keyPressed() {
  if (key == ' ') {
    mostrarTexto = !mostrarTexto;
  }
}
