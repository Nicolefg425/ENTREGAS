//Nicole Fernández
//E5: Sonido
//Velos de relojes

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
  size (800, 800);
  background (255);
  noStroke ();
  minim= new Minim (this);
  player= minim.loadFile ("Clocks.mp3");
}

  void draw(){
  
  float x1= random (width);
  float y1= random (height);
  float x2= x1 + random (-300, 300);
  float y2= y1 + random (-300, 300);
  float x3= x1 + random (-300, 300);
  float y3= y1 + random (-300, 300);
  
  fill (random (100, 120), random (50, 200), random (150, 255), 40);
  ellipse (x1, y1, x2, y2);
  fill (random (110), random (200), random (250), 20);
  triangle (x1, y1, x2, y2, x3, y3);
  fill (random (100, 200), random (200, 255), random (150, 255), 60);
  rect (x1, y1, x2, y2);
  
  if (player.isPlaying()){
    text("Presiona una tecla para Stop.", 10, 20);
  }
  else {
    text("Presiona una tecla para Play.", 10, 20);
  }
}

void keyPressed() {
  if (player.isPlaying()){
    player.pause();
  }
  else {
    player.play();
  }
}
